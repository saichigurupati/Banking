<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Withdraw Error</title>
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
            background-image: url('ee.gif');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            opacity: 1; /* Adjust the opacity value */
            z-index: -1; /* Ensure it's behind other content */
        }
    #hell{
    	margin-top:250px;
        text-align: center;
        color: white;
            
    }
    #hed{
       	color:red;
       	margin-top:10px;
       	text-align:center;
    }
    a{
    color:white;
    }
    
        h2{
            padding-top: 50px;
            text-align: center;
            margin-top: 25px;
            color: black;
            animation: blink 0.5s infinite alternate;
        }
        @keyframes blink {
            0% {
                opacity: 1;
            }
            100% {
                opacity: 0;
            }
        
</style>
</head>
<body>

    <h2>Error</h2>
    <p id="hell">${errorMessage}</p>
    <p id="hed"><a href="<%= request.getContextPath() %>/WithdrawServlet">Go back</a></p>
</body>
</html>
