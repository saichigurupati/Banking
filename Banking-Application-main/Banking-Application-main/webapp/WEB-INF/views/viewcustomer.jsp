<%@ page import="java.util.List" %>
<%@ page import="register.Customer" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Customer Details</title>
    <style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      
        align-items: center;
        justify-content: center;
        
        background-color: white;
        color: black;
    }
    .header-strip { 
            background-color: rgba(238, 225, 225, 0.5);
  			padding: 4px 0;
  			text-align: left;
  			color: black;
  			margin-top:-5px;
        }
	h1 {
            margin-left: 50px;
            opacity: 0; /* Initially hidden */
            animation: fadeIn 1s forwards;
        }
	
    h2 {
        text-align: center;
        margin-bottom: 25px;
        color: black;
        animation: fadeInUp 1s ease-in-out;
    }

    table {
        width: 80%;
        margin: auto;
        margin-bottom:70px;
        border-collapse: collapse;
        box-shadow: 0 0 10px black;
        animation: fadeIn 1s ease-in-out;
        background-color: rgba(238, 225, 225, 0.5); 
    }

    th, td {
        border: 1px solid black;
        padding: 12px;
        text-align: left;
        transition: background-color 0.3s ease-in-out;
    }

    th {
        background-color: black;
        color: white; 
        animation: fadeInLeft 1s ease-in-out;
    }
    tr{
    transition: background-color 0.3s ease-in-out;
    }
    

    
     @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes fadeInLeft {
            from {
                opacity: 0;
                transform: translateX(-50px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }
        tr:hover {
        background-color: #333;
        animation: fadeIn 0.5s ease-in-out;
        color: white;
    }
    .tile {
    margin: auto; 
    text-align: center; 
}
img{
		max-width:8%;
		heigth:auto;
}


</style>

</head>
<body>
<div class="header-strip">
        <h1>Banking Application</h1>
    </div>
    <div class="tile">
        <img src="viewcustomer.jpeg" alt="Add Customer">
        
    </div>

<h2>Customer Details</h2>

<table border="1">
    <thead>
        <tr>
            <th>Account Number</th>
            <th>Full Name</th>
            <th>Address</th>
            <th>Email ID</th>
            <th>Date of Birth</th>
        </tr>
    </thead>
    <tbody>
        <% List<Customer> customerList = (List<Customer>) request.getAttribute("customers");
           for (Customer customer : customerList) { %>
            <tr>
                <td><%= customer.getAccountNumber() %></td>
                <td><%= customer.getFullName() %></td>
                <td><%= customer.getAddress() %></td>
                <td><%= customer.getEmailId() %></td>
                <td><%= customer.getDob() %></td>
            </tr>
        <% } %>
    </tbody>
</table>

</body>
</html>
