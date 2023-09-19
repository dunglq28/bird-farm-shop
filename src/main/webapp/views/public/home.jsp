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
        <a href="guest?btAction=loginPage">Login</a><br><br>
        <a href="guest?btAction=registerPage">Register</a>
        <p>${sessionScope.ACCOUNT.fullName}</p>
    </body>
</html>
