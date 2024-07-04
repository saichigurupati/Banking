package register;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register/DeleteServlet")
public class DeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CustomerDao customerDao;

    public void init() {
        customerDao = new CustomerDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getSession().getAttribute("loggedIn") != null && (boolean) request.getSession().getAttribute("loggedIn")) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/delete.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendRedirect("/AccountServlet");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accountNumber = (String) request.getSession().getAttribute("accountNumber");

        if (customerDao.isBalanceZero(accountNumber)) {
            if (customerDao.deleteAccount(accountNumber)) {
                response.sendRedirect(request.getContextPath() + "/LoginServlet");
            } else {
                // Handle database error
                response.sendRedirect("/error.jsp");
            }
        } else {
            request.setAttribute("errorMessage", "You cannot delete the account because the balance is not zero.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/deleteerror.jsp");
            dispatcher.forward(request, response);
        }
    }
}
