<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Customer</title>
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
		max-width:30%;
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
        <img src="adduser.jpeg" alt="Add Customer">
    </div>
<h2>Add Customer</h2>
<form method="post" action="<%= request.getContextPath() %>/RegisterServlet" onsubmit="return validateForm()" enctype="multipart/form-data">
        <label for="full_name">Full Name:</label>
        <input type="text" id="full_name" name="full_name" required><br>

        <label for="address">Address:</label>
        <input type="text" id="address" name="address" required><br>

        <label for="email_id">Email ID:</label>
        <input type="email" id="email_id" name="email_id" required><br>
        
        <label for="account">Account Type:</label>
        <input type="text" id="account" name="account" required><br>

        <label for="balance">Balance:</label>
        <input type="text" id="balance" name="balance" required><br>

        <label for="dob">Date of Birth:</label>
        <input type="text" id="dob" name="dob" placeholder="YYYY-MM-DD" required><br>

        <label for="id_proof">ID Proof:</label>
        <input type="file" id="id_proof" name="id_proof" accept="image/*"><br>

        <input type="submit" value="Register">
        <p><strong>Note:</strong>The Id proof Should be in the Image Format</p>
    </form>
    <script>
        function validateForm() {
            var balance = document.getElementById("balance").value;
            var filePath = fileInput.value;
            var allowedExtensions = /(\.pdf)$/i;
            if (isNaN(balance) || parseFloat(balance) < 1000) {
                alert("Balance should be a numeric value and equal or above 1000");
                return false;
            }

            var email = document.getElementById("email_id").value;
            var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(email)) {
                alert("Invalid email address");
                return false;
            }
            if (!allowedExtensions.exec(filePath)) {
                alert('Please upload file in Pdf Format only.');
                fileInput.value = '';
                return false;
            }

            return true;
        }
    </script>




</body>
</html>