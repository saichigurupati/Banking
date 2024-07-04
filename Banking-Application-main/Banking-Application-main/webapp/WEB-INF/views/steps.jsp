<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Account</title>
    <style>
       
.section-title {
    color: #4b4b4b !important;
    text-align: center;
    margin-bottom: 32px;
}
.steps-section {
    position: relative;
    color: #fff;
}

.steps-section::before {
    content: "";
    position: absolute;
    z-index: -1;
    top: 60px;
    left: 0;
    width: 100%;
    height: 310px;
    background: radial-gradient(57.63% 615.36% at 50.03% 52.3%,#20a9f3 0,#1684de 100%);
}

.steps-section .inner {
    padding-bottom: 20px;
}

.steps-section .step-container {
    display: flex;
    margin: 0 -15px;
}

.steps-section .left {
    width: 48%;
    padding: 0 15px;
	height: 340px;
}

.steps-section .section-title {
    position: absolute;
    top: 20px;
    font-size: 18px;
    margin: 0;
    color:black;
}

.steps-section .steps {
    padding-top: 70px;
    max-width: 580px;
}

.steps-section .steps .row:first-child {
    padding-bottom: 20px;
}

.steps-section .steps .row {
    position: relative;
    display: flex;
    flex-wrap: wrap;
    -webkit-flex-wrap: wrap;
    -ms-flex-wrap: wrap;
}

.steps-section .steps .step {
    width: 50%;
    display: flex;
    min-height: 85px;
}

.steps-section .steps .step .number {
    font-size: 82px;
    opacity: .16;
    font-weight: 900;
    margin-right: 15px;
}

.steps-section .steps .step:first-child .text {
    min-width: 100px;
}

.steps-section .steps .step .text {
    font-size: 16px;
    line-height: 22px;
    padding:15px 0px
}

.steps-section .steps .step:first-child::after {
    content: "";
    display: inline-block;
 
    width: 65px;
    height: 5px;
    position: relative;
    left: 20px;
    top: 7px;
}

.steps-section .right {
    padding: 0 15px;
    width: 52%;
	height: 340px;
}

.steps-section .right .open-video {
    position: absolute;
    right: 0;
}

.steps-section .right .open-video {
    position: absolute;
    right: 0;
}
.steps-section .more {
    color: #fff;
}

@media screen and (max-width: 991px){

.steps-section .step-container {
    flex-direction: column;
}

.steps-section .steps {
    margin: 0 auto;
}
.steps-section .button-group {
    text-align: center;
}

.steps-section .left {
    width: 100%;
}

.steps-section .right {
    width: 100%;
    margin-top: 60px;
}

.steps-section .right .open-video {
    position: static;
    width: 100%;
    text-align: center;
}

.steps-section::before {
    height: 580px;
}

}

@media screen and (max-width: 640px){
.steps-section .steps {
    padding-top: 60px;
}
}

.steps-section .steps .step .number {
    font-size: 50px;
    margin-right: 10px;
}
.steps-section .steps .step:first-child .text {
    min-width: 80px;
    padding:11px 0px;
}

.steps-section .steps .step:first-child::after {
    width: 35px;
    background-size: 100%;
    left: 0;
}
button{
      padding: 10px 20px;
      font-size: 14px;
      margin: 0 10px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      background-color: rgb(219, 213, 51);
      color: white;
      
    }


.steps-section .button-group {
    margin-top: 40px;
}

.steps-section .right {
    margin-top: 40px;
}
.steps-section::before {
    height: 510px;
    top: 60px;
}
.steps-section .section-title {
    top: 12px;
}

.steps-section .right {
    height: 180px;
}
#popup-modal-content .modal-close {
    top: 31px !important;
    right: 51px !important;
}
.button-container {
            text-align: center;
            margin-top: 30px; /* Adjust as needed */
        }
        button:hover {
        font-size: 18px;
        font-weight: bold;
    }
       button a {
        text-decoration: none; 
        color: black;
    }
      
</style>
</head>
<body>
        <div class="steps-section">
            <div class="inner">
                <div class="step-container">
                    <div class="left">
                        <h2 class="section-title text-left"><strong>GET YOUR ACCOUNT IN JUST 4 STEPS</strong></h2>
                        <div class="steps">
                            <div class="row">
                                <div class="step">
                                    <div class="number">1</div>
                                    <div class="text">Call Customer Care/ visit nearby branch </div>
                                </div>
                                <div class="step">
                                    <div class="number">2</div>
                                    <div class="text">Provide details and verify your identity</div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="step">
                                    <div class="number">3</div>
                                    <div class="text">Get your <br>password instantly, online</div>
                                </div>
                                <div class="step">
                                    <div class="number">4</div>
                                    <div class="text">Log in with your Account No. and Password to access the account</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
        
    <div class="button-container">
        <button ><a href="<%= request.getContextPath() %>/LoginServlet">Login Page</a></button>
    </div>
      
</body>
</html>