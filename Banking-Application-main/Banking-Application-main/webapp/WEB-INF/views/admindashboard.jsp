<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            user-select: none;
        }
        
        .header-strip {
            background-color: rgba(238, 225, 225, 0.5);
            padding: 10px 0;
            margin-top: 0px;
            text-align: left;
            color: black;
        }
        
        h1 {
            margin-left: 50px;
        }
        
        h2 {
            text-align: center;
            margin-top: 50px;
            color: black;
        }
       
        p {
            text-align: center;
            color: black;
            animation: blink 1s infinite alternate;
        }
        
        @keyframes blink {
            0% {
                opacity: 1;
            }
            100% {
                opacity: 0;
            }
        }
        
        .tiles-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            margin-top: 20px;
        }
        
        .tile {
            width: 200px;
            margin-bottom: 20px;
            text-align: center;
        }
        
        .tile img {
            width: 100px;
            height: 100px;
            margin-bottom: 10px;
        }

        button {
            background-color: black;
            color: white;
            padding: 10px 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease, color 0.3s ease, font-size 0.3s ease, font-weight 0.3s ease;
        }

        button a {
            text-decoration: none; 
            color: white;
        }
        
        button:hover {
            font-size: 18px;
            font-weight: bold;
        }
    </style>
</head>
<body>
  <div class="header-strip">
        <h1>Banking Application</h1>
    </div>
    <h2>Welcome to the Admin Dashboard</h2>
    <p>This is a secure area for administrators.</p>
    
    <div class="tiles-container">
        <div class="tile">
            <img src="adduser.jpeg" alt="Add Customer">
            <button><a href="<%= request.getContextPath() %>/RegisterServlet">Add Customer</a></button>
        </div>
        <div class="tile">
            <img src="modifyuser.jpeg" alt="Modify Customer">
            <button><a href="<%= request.getContextPath() %>/ModifyCustomerServlet">Modify Customer</a></button>
        </div>
        <div class="tile">
            <img src="viewcustomer.jpeg" alt="View Customer Details">
            <button><a href="<%= request.getContextPath() %>/ViewCustomerServlet">View Customer Details</a></button>
        </div>
        <div class="tile">
            <img src="deleteuser.jpeg" alt="Delete Customer">
            <button><a href="<%= request.getContextPath() %>/DeleteCustomerServlet">Delete Customer</a></button>
        </div>
    </div>
</body>
</html>
