<%-- 
    Document   : home
    Created on : Sep 17, 2023, 12:41:43 AM
    Author     : hj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Home</h1>
        <c:if test="${empty sessionScope.ACCOUNT}">
            <a href="guest?btAction=loginPage">Login</a><br><br>
            <a href="guest?btAction=registerPage">Register</a>
        </c:if>
        <c:if test="${not empty sessionScope.ACCOUNT}">
            <p>${sessionScope.ACCOUNT.fullName}</p>
            <p>${sessionScope.ACCOUNT.roleName}</p>
            <a href="guest?btAction=logout">Logout</a><br><br>
        </c:if>
    </body>
</html>
