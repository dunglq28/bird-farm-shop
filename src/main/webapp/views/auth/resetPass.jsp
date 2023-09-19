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
        <title>Reset Password Page</title>
        <link rel="stylesheet" href="./assets/css/forgetpass.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <style>
            .login-error {
                color: red;
                font-size: 15px;
                margin-top: -18px;
                margin-left: 2px;
            }
        </style>
    </head>
    <body>      

        <div class="retrieval">
            <h1 class="retrieval-heading">Password retrieval</h1>
            <form action="guest" class="retrieval-form" autocomplete="off" method="Post"> 

                <c:set var="err" value="${requestScope.CREATE_ERROR}"/>

                <input type="hidden" name="txtContact" value="${param.txtContact}">

                <label for="password" class="retrieval-label">Enter new password</label>
                <input name="txtPassword" type="password" class="password-input" placeholder="Eg: 123456">
                <c:if test="${not empty err.emptyPassword}">
                    <p class="login-error">${err.emptyPassword}</p><br>
                </c:if>
                <c:if test="${not empty err.wrongPassword}">
                    <p class="login-error">${err.wrongPassword}</p><br>
                </c:if>

                <label for="password" class="retrieval-label">Confirm your password</label>
                <input name="txtConfirm" type="password" class="password-input">
                <c:if test="${not empty err.confirmError}">
                    <p class="login-error">${err.confirmError}</p><br>
                </c:if>


                <button name="btAction" value="CreateNewPassword"class="password-submit">Create new password</button>
            </form>     
        </div>                
       
    </body>
</html>
