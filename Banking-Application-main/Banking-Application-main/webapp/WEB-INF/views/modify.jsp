<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="register.Customer" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Modify Customer Details</title>
<style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            user-select: none;
        }
        .header-strip {    
  		background-color: rgba(238, 225, 225, 0.5); /* Adjust the alpha value (last parameter) as needed */
  		padding: 2px 0;
  		text-align: left;
  		color: black ;

        }
       
        h1 {
            margin-left: 50px;
            opacity: 0; /* Initially hidden */
            animation: fadeIn 1s forwards;
        }

        @keyframes fadeIn {
            100% {
                opacity: 1;
            }
        }


        
        h2 {
            text-align: center;
            color: black;
            
            margin-top: -100px; /* Initially hidden */
            opacity: 0;
            animation: slideIn 1s forwards; /* Slide in from top */
        }

        @keyframes slideIn {
            100% {
                margin-top: 0px;
                opacity: 1;
            }
        }

        form {
            width: 300px;
            background-color: rgba(238, 225, 225, 0.5); 
            margin: 0 auto;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 5px;
            color:black;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"] {
            width: calc(100% - 20px);
            padding: 10px;
            color: black;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
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
        .tile {
    margin: auto; 
    text-align: center; 
		max-width:25%;
		heigth:20%;
	}
		img{
		max-width:40%;
		heigth:auto;
}

    </style>
</head>
<body>
	<div class="header-strip">
        <h1>Banking Application</h1>
    </div>
    <div class="tile">
        <img src="modifyuser.jpeg" alt="Add Customer">
    </div>
    <h2>Modify Customer Details</h2>

    <form action="${pageContext.request.contextPath}/register/ModifyCustomerServlet" method="post">
        <label for="accountNumber">Account Number:</label>
        <input type="text" id="accountNumber" name="accountNumber" value="${customer.accountNumber}"><br>

        <label for="fullName">Full Name:</label>
        <input type="text" id="fullName" name="fullName" value="${customer.fullName}" required><br>

        <label for="address">Address:</label>
        <input type="text" id="address" name="address" value="${customer.address}" required><br>

        <label for="emailId">Email ID:</label>
        <input type="email" id="emailId" name="emailId" value="${customer.emailId}" required><br>

        <label for="dob">Date of Birth:</label>
        <input type="date" id="dob" name="dob" value="${customer.dob}" required><br>

        <input type="submit" value="Modify">
    </form>

</body>
</html>
