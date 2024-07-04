<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="register.AccountDetails" %>

<html>
<head>
    <title>Account Details</title>
    <style>
    body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            
            user-select: none;
        }
       
        h1{
        margin-left: 50px;
        color: black;
    }
    h2{	
    	margin-top:5px;
        color: black;
        text-align:center;
    }
        .header-strip {
        background-color: rgba(238, 225, 225, 0.5);
        padding: 10px 0;
        margin-top: 0px;
        text-align: left;
        color: black;
    }
    .accountdetails
    {
        color:black;
        text-align: center;
        animation: slide-in 2s ease;
    }
    @keyframes fade-in {
        from {
            opacity: 0; /* Start with opacity 0 */
        }
        to {
            opacity: 1; /* End with opacity 1 */
        }
    }
    @keyframes slide-in {
        from {
            transform: translateX(100%); /* Start from outside the screen on the right */
        }
        to {
            transform: translateX(0); /* Move to the original position */
        }
    }
    .container {
            max-width: 600px;
            margin: 20px auto;
            color: white;
            padding: 20px;
            border-radius: 8px;
            border: 2px solid black;
        box-shadow: 0 0 10px rgba(2, 11, 2, 0.5);
        }

    .detail-box {
            margin-bottom: 10px;
            border-radius: 5px;
            animation: fade-in 3s ease; 
            border: 2px solid black;
            box-shadow: 0 0 10px rgba(2, 11, 2, 0.5);
        }
        .detail-label {
            font-weight: bold;
            color: black;
            padding: 10px;
            border: 2px solid black;
            text-align: center;
        }
        .detail-value {
            color: black;
            padding: 10px;
            text-align: center;
            background-color: white;
            border: 2px solid black;
        }
        .tile {
    margin: auto;
    text-align: center;
}
img{
max-width:10%;
height:auto;
}

</style>
</head>
<body>
<div class="header-strip">
        <h1>Banking Application</h1>
    </div>
<div class="tile">
    <img src="account.gif" alt="Add Customer">
    
</div>
<h2>Account Details</h2>
<div class="container">
    

    <%
        AccountDetails accountDetails = (AccountDetails) request.getAttribute("accountDetails");
        if (accountDetails != null) {
    %>
        <div class="detail-box">
            <div class="detail-label">Account Number:</div>
            <div class="detail-value"><%= accountDetails.getAccountNumber() %></div>
        </div>
        <div class="detail-box">
            <div class="detail-label">Account Holder Name:</div>
            <div class="detail-value"><%= accountDetails.getFullName() %></div>
        </div>
        <div class="detail-box">
    		<div class="detail-label">Account Type:</div>
    		<div class="detail-value"><%= accountDetails.getAccount() %></div>
		</div>
		<div class="detail-box">
    		<div class="detail-label">Account Holder Address:</div>
    		<div class="detail-value"><%= accountDetails.getAddress() %></div>
		</div>
		<div class="detail-box">
    		<div class="detail-label">Account Holder EmailId:</div>
    		<div class="detail-value"><%= accountDetails.getEmailId() %></div>
		</div>
		<div class="detail-box">
    		<div class="detail-label">Account Holder Balance:</div>
    		<div class="detail-value"><%= accountDetails.getBalance() %></div>
		</div>
		<div class="detail-box">
    		<div class="detail-label">Account Holder Dob:</div>
    		<div class="detail-value"><%= accountDetails.getDob() %></div>
		</div>
    <%
        } else {
    %>
        <p>Account details not available.</p>
    <%
        }
    %>
</div>

</body>
</html>