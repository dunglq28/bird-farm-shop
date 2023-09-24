<%-- 
    Document   : resetPass
    Created on : Sep 19, 2023, 12:42:24 PM
    Author     : hj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reset Password</title>
        <link rel="stylesheet" href="./assets/css/auth.css" type="text/css">
    </head>
    <body>      

        <div class="box">
            <div class="header">
                <header>Password retrieval</header>
            </div>
            <form action="guest" autocomplete="off" method="Post">
                <c:set var="err" value="${requestScope.CREATE_ERROR}"/>
                <input type="hidden" name="txtContact" value="${param.txtContact}">
                <div class="input-box">
                    <input name="txtPassword" type="password" class="input-field" id="password" autocomplete="off">
                    <label for="password">Enter new password</label>
                    <c:if test="${not empty err.emptyPassword}">
                        <p class="input-error">${err.emptyPassword}</p><br>
                    </c:if>
                    <c:if test="${not empty err.wrongPassword}">
                        <p class="input-error">${err.wrongPassword}</p><br>
                    </c:if>
                </div> <br>

                <div class="input-box">
                    <input name="txtConfirm" type="password" class="input-field" id="password" autocomplete="off">
                    <label for="password">Confirm your password</label>
                    <c:if test="${not empty err.confirmError}">
                        <p class="login-error">${err.confirmError}</p><br>
                    </c:if>
                </div> <br>

                <div class="input-box">
                    <input name="btAction" type="submit" class="input-submit" value="CreateNewPassword">
                </div>
            </form>


        </div>
    </body>
</html>
