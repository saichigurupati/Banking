<!-- login.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Page</title>
    <style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        
        user-select: none;
    }
    body::after {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-image: url('customer.gif');
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        opacity: 0.8; /* Adjust the opacity value */
        z-index: -1; /* Ensure it's behind other content */
    }
    .header-strip {
		padding: 1px 0;
		text-align: left;
		color: black;
    }
     h1 {
            margin-left: 50px;
            margin-top:14px;
            opacity:1;
        }
    input[type="text"],
        input[type="password"] {
            width: 100%;
            background-color: white;
            padding: 10px;
            margin-bottom: 10px;
            border: 2px solid black;
            border-radius: 4px;
            box-sizing: border-box; 
            color: black;
            opacity:1;
            
        }
        .steps,
        .change-password {
            justify-content: center;
            display: inline-block;
            text-align: center;
            margin-top: 5px;
            text-decoration: none;
            color: black;
        }

        .steps:hover,
        .change-password:hover {
            text-decoration: underline;
            color: #1a1a1a;
        }
        .password-links {
            text-align: center;
        }

    h2 {
        color: black;
        font-size:28px;
        font-weight:bold;
        margin-top: 0px;
        opacity: 0;
        margin-left:614px;
        animation: slideIn 1s forwards;
    }

    @keyframes slideIn {
        100% {
            margin-top: 5px;
            margin-bottom:0px;
            opacity: 1;
        }
    }

    form {
        width: 250px;
        
        margin: 0 auto;
        padding: 10px;
        border-radius: 8px;
        margin-top:20px;
        margin-left:585px;
    }

    label {
        display: block;
        margin-bottom: 5px;
        color:black;
        font-weight:bold;
    }

    input[type="submit"] {
        width: 100%;
        padding: 10px;
        background-color: black;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        font-weight: bold;
        font-size: 18px;
    }
</style>
</head>
<body>
<div class="header-strip">
        <h1>Banking Application</h1>
    </div>
<h2>Customer Login</h2>
    <form action="<%= request.getContextPath() %>/LoginServlet" method="post">
        <label for="accountNumber">Account Number:</label>
        <input type="text" id="accountNumber" name="accountNumber" required><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br>
        <input type="submit" value="Login"><br>
        <div class="password-links">
        <a class="change-password" href="ChangePasswordServlet">Change Password</a><br>
        <a class="steps" href="StepServlet">New User</a><br>
        </div>
    </form>
</body>
</html>`