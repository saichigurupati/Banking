package register;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;

@WebServlet("/register/DS")
public class DS extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CustomerDao customerDao;

    public void init() {
        customerDao = new CustomerDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getSession().getAttribute("loggedIn") != null && (boolean) request.getSession().getAttribute("loggedIn")) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/deposit.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendRedirect("LoginServlet");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accountNumber = (String) request.getSession().getAttribute("accountNumber");
        String amountParam = request.getParameter("amount1");
        BigDecimal amount = new BigDecimal(amountParam);

        boolean isUpdated = customerDao.updateBalanceForDeposit(accountNumber, amount);
        if (isUpdated) {
            customerDao.insertTransactionForDeposit(accountNumber, amount, "Deposit");
            response.sendRedirect("/Page/AccountServlet");
        } else {
            // Handle failure
            // For example, redirect to an error page
            response.sendRedirect("/error.jsp");
        }
    }
}
