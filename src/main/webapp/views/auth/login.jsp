<%-- 
    Document   : login
    Created on : Sep 22, 2023, 2:04:26 PM
    Author     : hj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign In</title>
        <link rel="stylesheet" href="./assets/css/auth.css" type="text/css">
        <link rel="stylesheet" href="./assets/css/homePage.css">
    </head>
    <body>
        <jsp:include page="/components/header.jsp"></jsp:include>
            <div class="container-form">
                <div class="box">
                    <div class="header-form">
                        <div header-form-title>Sign In</div>
                        <p>We are happy to have you back!</p>
                    </div>


                    <form action="log-in" method="POST">

                    <c:set var="err" value="${requestScope.CREATE_ERROR}" />
                    <c:set var="notification" value="${requestScope.NOTIFICATION}" />

                    <div class="input-box">
                        <input name="txtEmailLogin" value="${param.txtEmailLogin}" type="text" class="input-field" id="email" autocomplete="off">
                        <label for="email">Email address</label> <br>        
                        <c:if test="${not empty err.emptyEmail}">
                            <p class="input-error">${err.emptyEmail}</p>
                        </c:if>
                        <c:if test="${not empty err.wrongEmail}">
                            <p class="input-error">${err.wrongEmail}</p>
                        </c:if>
                    </div>


                    <div class="input-box">
                        <input name="txtPasswordLogin" type="password" class="input-field" id="password" autocomplete="off">
                        <label for="password">Password</label> <br>
                        <c:if test="${not empty err.emptyPassword}">
                            <p class="input-error">${err.emptyPassword}</p>
                        </c:if>
                        <c:if test="${not empty err.wrongPassword}">
                            <p class="input-error">${err.wrongPassword}</p>
                        </c:if>
                    </div>


                    <div class="forgot">
                        <div class="section-box">
                            <input type="checkbox" id="check">
                            <label for="check">Remember me</label>
                        </div>
                        <div class="section-box">
                            <a href="guest?btAction=forgetPassPage" class="forgot-link">Forgot password?</a>
                        </div>
                    </div>
                    <div class="input-box">
                        <input type="submit" class="input-submit" value="Sign In">
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
                    <p>Don't have account <a href="guest?btAction=registerPage">Sign up</a></p>
                </div>
            </div>
        </div>
        <jsp:include page="/components/footer.jsp"></jsp:include>
    </body>
</html>
