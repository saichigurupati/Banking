<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Withdraw Money</title>
    <style>
    body {
        font-family: 'Arial', sans-serif;
       
        
        
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    h2{
        color: black;
        text-align: center;
        padding-top: 150px;
        margin-top: -120px;
    }

    form {
        
        width: 300px;
        max-width: 400px;
        margin: auto;
        padding: 20px;
        border-radius: 8px;
      
        border: 2px solid black;
        
    }

    label {
        display: block;
        margin-bottom: 8px;
        color: black;
    }

    input {
        width: 100%;
        padding: 8px;
        margin-bottom: 16px;
        box-sizing: border-box;
       
        border-radius: 4px;
    }

    input[type="submit"] {
        background-color: black;
        color: white;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    input[type="submit"]:hover {
       font-size: 18px;
       font-weight: bold;
    }
    .tile {
    margin: auto; /* This centers the entire tile horizontally */
    text-align: center; /* This centers the contents (the image) within the tile */
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

    img{
max-width:20%;
height:auto;
margin-top: 10px;
}
</style>
</head>
<body>
<div class="header-strip">
        <h1>Banking Application</h1>
    </div>
    <div class="tile">
        <img src="withdraw.gif" alt="Add Customer">
        
    </div>

    <h2>Withdraw Money</h2>
    
    <form action="<%= request.getContextPath() %>/WithdrawServlet" method="post" onsubmit="return validateForm()">
        <label for="amount">Enter Amount:</label>
        <input type="text" id="amount1" name="amount1" required>
        <br>
        <input type="submit" value="Withdraw" name="submit">
    </form>
    <script>
		function validateForm() {
    		var amount = document.getElementById("amount1").value;
    		if (amount <= 0) {
        		alert("Withdrawal amount must be more than zero.");
       			return false;
    }
    return true;
}
</script>

</body>
</html>
