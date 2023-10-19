<%-- 
    Document   : siveBar
    Created on : Oct 17, 2023, 8:15:16 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>side bar</title>
    </head>
    <body>
        <div class="sidebar">
            <ul class="menu">
                <li class="active">
                    <a href="#">
                        <i class="fa-solid fa-cart-shopping"></i>
                        <span>Orders</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="fa-solid fa-egg"></i>
                        <span>Order Nest</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="fa-solid fa-venus-mars"></i>
                        <span>Breeding</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="fa-solid fa-users"></i>
                        <span>Staff Management</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="fa-solid fa-dove"></i>
                        <span>Birds</span>
                    </a>
                </li>
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
    </body>
</html>
