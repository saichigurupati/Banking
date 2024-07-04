package register;

import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CustomerDao customerDao;

    public void init() {
        customerDao = new CustomerDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/login.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accountNumber = request.getParameter("accountNumber");
        String password = request.getParameter("password");

        if (customerDao.isValidLogin(accountNumber, password)) {
            request.getSession().setAttribute("loggedIn", true);
            request.getSession().setAttribute("accountNumber", accountNumber);
            
            System.out.println("LoginServlet - Setting loggedIn to true");
            System.out.println("LoginServlet - Setting accountNumber: " + accountNumber);

            response.sendRedirect("/Page/CustomerDashboardServlet");
        } else {
        	response.getWriter().println("Error: Account No Or Password Incorrect");
        }
    }
}
