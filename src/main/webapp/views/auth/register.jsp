
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
        <link rel="stylesheet" href="./assets/css/auth.css" type="text/css">
        <style>
            .register-error {
                color: red;
                font-size: 15px;
                margin-top: -18px;
                margin-left: 2px;
            }
        </style>
    </head>
    <body>
        <div class="box">
            <div class="header">
                <header>Sign Up</header>
            </div>


            <form action="sign-up" method="POST">
                <c:set var="err" value="${requestScope.CREATE_ERROR}"/>
                <c:set var="email" value="${sessionScope.EMAIL}"/>
                <c:set var="fullname" value="${sessionScope.USERNAME}"/>   

                <div class="input-box">
                    <input name="txtEmail" value="${email}" type="text" class="input-field" id="email" autocomplete="off">
                    <label for="email">Email address</label><br>
                    <c:if test="${not empty err.emptyEmail}">
                        <p class="register-error">${err.emptyEmail}</p><br>
                    </c:if>
                    <c:if test="${not empty err.wrongEmail}">
                        <p class="register-error">${err.wrongEmail}</p><br>
                    </c:if>
                    <c:if test="${not empty err.isExistEmail}">
                        <p class="register-error">${err.isExistEmail}</p><br>
                    </c:if>
                </div>

                <div class="input-box">
                    <div class="form-vertify">
                        <input name="txtVerification" type="text" class="input-field" autocomplete="off">
                        <button name="btAction" value="Send" class="form-getcode">Send</button>
                    </div>
                    <label>Verification codes</label>
                    <c:if test="${not empty err.emptyVerification}">
                        <p class="register-error">${err.emptyVerification}</p><br>
                    </c:if>
                    <c:if test="${not empty err.wrongVerification}">
                        <p class="register-error">${err.wrongVerification}</p><br>
                    </c:if>
                </div>

                <div class="input-box">
                    <input name="txtPassword" type="password" class="input-field" id="password" autocomplete="off">
                    <label for="password">Password</label>
                    <c:if test="${not empty err.emptyPassword}">
                        <p class="register-error">${err.emptyPassword}</p>
                    </c:if>
                    <c:if test="${not empty err.wrongPassword}">
                        <p class="register-error">${err.wrongPassword}</p>
                    </c:if>
                </div> <br>

                <div class="input-box">
                    <input name="txtFullName" value="${fullname}" type="text" class="input-field" autocomplete="off">
                    <label>FullName</label>
                    <c:if test="${not empty err.emptyFullName}">
                        <p class="register-error">${err.emptyFullName}</p>
                    </c:if>
                </div>      
                    
                <div class="input-box">
                    <br><input name="btAction" value="Sign up" type="submit" class="input-submit" value="Sign Up">
                </div>
            </form>


            <div class="middle-text">
                <hr>
                <p class="or-text">Or</p>
            </div>
            <div class="social-sign-in">
                <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&redirect_uri=http://localhost:8084/BirdFarmShop/login-google&response_type=code
                   &client_id=1070154375273-hib2mbbkpbb47ral7kt3s763c25piprp.apps.googleusercontent.com&approval_prompt=force" class="input-google">
                    <img src="./assets/image/Auth_images/google.jpg" alt="">
                    <p>Google</p>
                </a>
                <a href="https://www.facebook.com/dialog/oauth?client_id=318980067328061&
                   redirect_uri=http://localhost:8084/BirdFarmShop/login-facebook" class="input-facebook">
                    <img src="./assets/image/Auth_images/facebook.png" alt="">
                    <p>Facebook</p>
                </a>
            </div>
            <div class="sign-up">
                <p>Already have a account ? <a href="guest?btAction=loginPage">Sign in</a></p>
            </div>
        </div>
    </body>
</html>
