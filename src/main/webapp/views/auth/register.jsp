
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Signup</title>
        <link rel="stylesheet" href="./assets/css/register.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
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
        <div class="signup">
            <h1 class="signup-heading">Sign up</h1>


            <div class="signup-social-gg">
                <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&redirect_uri=http://localhost:8084/BirdFarmShop/login-google&response_type=code
                   &client_id=1070154375273-hib2mbbkpbb47ral7kt3s763c25piprp.apps.googleusercontent.com&approval_prompt=force"
                   class="button-gg">
                    <span class="button-text">
                        Sign up with Google
                    </span>
                </a>

            </div>

            <div class="signup-social-fb">
                <a href="https://www.facebook.com/dialog/oauth?client_id=318980067328061&
                   redirect_uri=http://localhost:8084/BirdFarmShop/login-facebook" 
                   class="button-fb">

                    <span class="button-text">
                        Sign up with Facebook
                    </span>
                </a>
            </div>




            <div class="signup-or">
                <span>Or</span>
            </div>

            <form action="sign-up" class="signup-form" autocomplete="off" method="POST">  
                <c:set var="err" value="${requestScope.CREATE_ERROR}"/>
                <c:set var="email" value="${sessionScope.EMAIL}"/>
                <c:set var="fullname" value="${sessionScope.USERNAME}"/>   

                <label for="email" class="signup-label">Email Address</label>
                <input name="txtEmail" type="email" value="${email}" id="email" class="signup-input" placeholder="example@gmail.com">
                <c:if test="${not empty err.emptyEmail}">
                    <p class="register-error">${err.emptyEmail}</p>
                </c:if>
                <c:if test="${not empty err.wrongEmail}">
                    <p class="register-error">${err.wrongEmail}</p><br>
                </c:if>
                <c:if test="${not empty err.isExistEmail}">
                    <p class="register-error">${err.isExistEmail}</p><br>
                </c:if>
                <label for="verification" class="signup-label">Verification codes</label>
                <div class="signup-form-vertify">
                    <input name="txtVerification" type="text" class="signup-input" placeholder="Enter verification codes">
                    <button name="btAction" value="Send" class="signup-form-getcode">Send</button>                 
                </div>
                <c:if test="${not empty err.emptyVerification}">
                    <p class="register-error">${err.emptyVerification}</p><br>
                </c:if>
                <c:if test="${not empty err.wrongVerification}">
                    <p class="register-error">${err.wrongVerification}</p><br>
                </c:if>

                <label for="password" class="signup-label">Password</label>
                <input name="txtPassword" value="${password}" type="password" class="signup-input" placeholder="Eg: 123456">
                <c:if test="${not empty err.emptyPassword}">
                    <p class="register-error">${err.emptyPassword}</p><br>
                </c:if>
                <c:if test="${not empty err.wrongPassword}">
                    <p class="register-error">${err.wrongPassword}</p><br>
                </c:if>

                <label for="fullname" class="signup-label">Full name</label>
                <input name="txtFullName" value="${fullname}" type="text" id="fullname" class="signup-input" placeholder="Eg: Nguyen Van A">
                <c:if test="${not empty err.emptyFullName}">
                    <p class="register-error">${err.emptyFullName}</p><br>
                </c:if>

                <button name="btAction" value="Sign up" class="signup-submit">Sign up</button>
            </form>


            <p class="signup-already">
                <span>Already have a account ?</span>
                <a href="guest?btAction=loginPage" class="signup-login-link">Login</a>
            </p>
        </div>
    </div>
</body>
</html>
