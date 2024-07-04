<%@ page import="java.util.List" %>
<%@ page import="register.Transaction" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Transaction History</title>
   <style>
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  
    align-items: center;
    justify-content: center;
    height: 100vh;
    background-color: white;
    color: black;
}
.header-strip {
        
        background-color: rgba(238, 225, 225, 0.5);
padding: 10px 0;
text-align: left;
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
h2 {
    text-align: center;
    margin-bottom: 25px;
    color: black;
    animation: fadeInUp 1s ease-in-out;
}

form {
            width: 300px;
            margin: 0 auto;
            padding: 20px;
            border-radius: 8px;
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
table {
    width: 80%;
    margin: auto;
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
margin: auto; /* This centers the entire tile horizontally */
text-align: center; /* This centers the contents (the image) within the tile */
}
img{
		max-width:13%;
		heigth:auto;
}
</style>
</head>

<body>
<div class="header-strip">
        <h1>Banking Application</h1>
      </div>
      <div class="tile">
        <img src="transactions.gif" alt="Add Customer">
        
    </div>

<h2>Transaction History</h2>

<% 
List<Transaction> transactionList = (List<Transaction>) request.getAttribute("transactions");
System.out.println("Transaction list size in JSP: " + (transactionList != null ? transactionList.size() : "null"));
if (transactionList != null && !transactionList.isEmpty()) {
%>
    <table border="1">
        <thead>
            <tr>
                <th>Account Number</th>
                <th>Amount</th>
                <th>Transaction Type</th>
                <th>Transaction Time</th>
            </tr>
        </thead>
        <tbody>
            <% for (Transaction transaction : transactionList) { %>
                <tr>
                    <td><%= transaction.getAccountNumber() %></td>
                    <td><%= transaction.getAmount() %></td>
                    <td><%= transaction.getTransactionType() %></td>
                    <td><%= transaction.getTransactionTime() %></td>
                </tr>
            <% } %>
        </tbody>
    </table>
<% } else { %>
    <p>No transactions found.</p>
<% } %>

<br>
<form action="MiniServlet" method="get">
    <input type="submit" value="Print in PDF">
</form>

</body>
</html>
