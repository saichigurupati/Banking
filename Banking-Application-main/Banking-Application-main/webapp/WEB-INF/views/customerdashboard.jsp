<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="register.AccountDetails" %>   
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer DashBoard</title>
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
   
    .error {
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
        position: relative;
        padding-top: 50px; /* Add padding for image */
    }
    
    .tile img {
        width: 100px;
        height: 100px;
        position: absolute;
        top: 0;
        left: 50%;
        transform: translateX(-50%);
    }

    button {
        margin-top: 70px;
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
    #balance{
    text-align: center;
        color: black;
        font-size:18px;
    }
</style>
</head>
<body>
    <div class="header-strip">
        <h1>Banking Application</h1>
    </div>
    <%
        AccountDetails accountDetails = (AccountDetails) request.getAttribute("accountDetails");
        if (accountDetails != null) {
    %>
    <%
    if (request.getSession().getAttribute("loggedIn") != null && (boolean) request.getSession().getAttribute("loggedIn")) {
%>
    <h2>Welcome to your Dashboard, <%= request.getSession().getAttribute("accountNumber") %>!</h2>
    <p id="balance"><strong>Current Balance:</strong> <%= accountDetails.getBalance() %></p>
    <div class="tiles-container">
        <div class="tile">
            <img src="account.jpeg" alt="Account">
            <button><a href="<%= request.getContextPath() %>/AccountServlet">Account</a></button>
        </div>
        <div class="tile">
            <img src="transactions.jpeg" alt="Transactions">
            <button><a href="<%= request.getContextPath() %>/TransactionServlet">Transactions</a></button>
        </div>
        <div class="tile">
            <img src="deposit.jpeg" alt="Deposit">
            <button><a href="<%= request.getContextPath() %>/DS">Deposit</a></button>
        </div>
        <div class="tile">
            <img src="withdrawl.jpeg" alt="Withdraw">
            <button><a href="<%= request.getContextPath() %>/WithdrawServlet">Withdraw</a></button>
        </div>
        <div class="tile">
            <img src="delete.jpeg" alt="Delete">
            <button><a href="<%= request.getContextPath() %>/DeleteServlet">Delete</a></button>
        </div>
        <div class="tile">
            <img src="logout.jpeg" alt="Logout">
            <button><a href="<%= request.getContextPath() %>/LogutServlet">Logout</a></button>
        </div>
    </div>
    
  
        <%
    } else {
%>
    <p class="error">You are not logged in. Please log in to access the dashboard.</p>
<%
    }
%>
<%
        } else {
    %>
        <p class="error">Account details not available.</p>
    <%
        }
    %>
</body>
</html>