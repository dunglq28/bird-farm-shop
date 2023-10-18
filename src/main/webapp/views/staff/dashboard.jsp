<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
            />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
            integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <link rel="stylesheet" href="../../assets/css/dashboard.css" />
        <title>Dash Board</title>
    </head>
    <body>

        <div class="sidebar">
            <div class="logo">Bird Farm Shop</div>
            <c:set var="admin" value="Admin" />
            <c:set var="staff" value="Staff" />
            <c:set var="manager" value="Manager" />
            <ul class="menu">
                <c:if test="${sessionScope.ACCOUNT.roleName != staff}">
                    <li class="active">
                        <a href="#">
                            <i class="fas fa-tachometer-alt"></i>
                            <span>Dashboard</span>
                        </a>
                    </li>
                </c:if>


                <li>
                    <a href="#">
                        <i class="fa-solid fa-cart-shopping"></i>
                        <span>Orders in queue</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="fas fa-chart-bar"></i>
                        <span>Orders has been taken</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="fas fa-briefcase"></i>
                        <span>Account manager</span>
                    </a>
                </li>
                
                <li>
                    <a href="#">
                        <i class="fas fa-question-circle"></i>
                        <span>Products</span>
                    </a>
                </li>
                
<!--                <li>
                    <a href="#">
                        <i class="fas fa-star"></i>
                        <span>Testimonials</span>
                    </a>
                </li>-->
                
                <li>
                    <a href="#">
                        <i class="fas fa-cog"></i>
                        <span>Settings</span>
                    </a>
                </li>
                
                <li class="logout">
                    <a href="guest?btAction=logout">
                        <i class="fas fa-sign-out-alt"></i>
                        <span>Logout</span>
                    </a>
                </li>
            </ul>
        </div>
        <div class="main--content">
            <div class="header-wrapper">
                <div class="header--title">
                    <span>Primary</span>
                    <h2>Dashboard</h2>
                </div>
                <div class="user--info">
                    <div class="search--box">
                        <i class="fa-solid fa-search"></i>
                        <input type="text" placeholder="search" />
                    </div>
                    ${sessionScope.ACCOUNT.fullName}

                </div>
                </body>
                </html>
