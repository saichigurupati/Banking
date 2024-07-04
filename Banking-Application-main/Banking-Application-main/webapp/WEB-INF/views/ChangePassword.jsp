<!-- ChangePassword.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Change Password</title>
<style>
h2{
    text-align: center;
    padding-top: 150px;
    color: #1B3C73;
}
body {
   
    font-family: Arial, sans-serif;
    background-color: #E7E8D1;
            background-size: cover;
            background-position: center;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
input[type="submit"] {
            background-color: #1B3C73;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s ease;
        }
        form {
            background-color: #A7BEAE;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            color: #1B3C73;
            margin: auto;
        }
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box; /* Ensure padding and border are included in width */
        }
        
        input[type="submit"]:active {
    transform: translateY(2px); /* Push the button down slightly when clicked */
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2); /* Add a shadow when clicked */
}
</style>
</head>
<body>
<h2>Change your Password!</h2>
    <form action="<%= request.getContextPath() %>/ChangePasswordServlet" method="post" onsubmit="return validatePassword()">
        <label for="accountNumber">Account Number:</label>
        <input type="text" id="accountNumber" name="accountNumber" required><br>
        <label for="oldPassword">Old Password:</label>
        <input type="password" id="oldPassword" name="oldPassword" required><br>
        <label for="newPassword">New Password:</label>
        <input type="password" id="newPassword" name="newPassword" required><br>
        
        <input type="submit" value="Change Password">
        <p><strong>NOTE:</strong>Password Should Contain more than 7 Characters and one Special Character Is Mandatory</p>
    </form>
    <script>
        function validatePassword() {
            var newPassword = document.getElementById("newPassword").value;

            if (newPassword.length < 8 || newPassword.length > 21) {
                alert("Password should be between 8 and 21 characters.");
                return false;
            }

            var specialCharacterRegex = /[!@#$%^&*()_+{}\[\]:;<>,.?~\\/-]/;
            if (!specialCharacterRegex.test(newPassword)) {
                alert("Password should contain at least one special character.");
                return false;
            }

            return true;
        }
    </script>
</body>
</html>
