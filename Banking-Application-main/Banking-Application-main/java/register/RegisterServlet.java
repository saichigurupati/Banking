package register;

import java.io.IOException;
import jakarta.servlet.annotation.MultipartConfig;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
@MultipartConfig
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CustomerDao customerDao;

    public void init() {
        customerDao = new CustomerDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/signup.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullName = request.getParameter("full_name");
        String address = request.getParameter("address");
        String emailId = request.getParameter("email_id");
        String account = request.getParameter("account");
        String balance = request.getParameter("balance");
        String dob = request.getParameter("dob");
        Part filePart = request.getPart("id_proof");

        int accountNumber = generateUniqueAccountNumber();
        String password = generateRandomPassword();

        boolean registrationSuccess = customerDao.registerCustomer(accountNumber, fullName, address, emailId, password, account, balance, dob, filePart);

        if (registrationSuccess) {
            request.setAttribute("accountNumber", accountNumber);
            request.setAttribute("password", password);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/registrationSuccess.jsp");
            dispatcher.forward(request, response);
        } else {
            System.out.println("Registration failed.");
        }
    }

    private int generateUniqueAccountNumber() {
        int newAccountNumber;
        do {
            newAccountNumber = 100000000 + new java.security.SecureRandom().nextInt(900000000);
        } while (customerDao.isAccountNumberExists(newAccountNumber));

        return newAccountNumber;
    }

    private String generateRandomPassword() {
        java.security.SecureRandom random = new java.security.SecureRandom();
        byte[] randomBytes = new byte[16];
        random.nextBytes(randomBytes);

        return java.util.Base64.getEncoder().encodeToString(randomBytes);
    }
}
