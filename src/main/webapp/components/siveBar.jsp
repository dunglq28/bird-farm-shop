<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="sidebar">
<<<<<<< HEAD
    <div class="logo">Bird Farm Shop</div>    
=======
    <div class="logo"></div>
>>>>>>> 6ffef84dac49557b20ac76567381b3be78e82301
    <c:set var="admin" value="Admin" />
    <c:set var="staff" value="Staff" />
    <c:set var="manager" value="Manager"/>
    <ul class="menu">
        <c:if test="${sessionScope.ACCOUNT.roleName != staff}">
            <li class="active">
                <a href="#">
                    <i class="fas fa-tachometer-alt"></i>
                    <span>Dashboard</span>
                </a>
            </li>
        </c:if>

        <c:if test="${sessionScope.ACCOUNT.roleName == staff}">
            <li>
                <a href="viewNewOrder">
                    <i class="fa-solid fa-cart-shopping"></i>
                    <span>Orders in queue</span>
                </a>
            </li>
        </c:if>

        <c:if test="${sessionScope.ACCOUNT.roleName == staff}">
            <li>
                <a href="viewMyOrder-staff?txtServiceID=1">
                    <i class="fas fa-chart-bar"></i>
                    <span>My Order</span>
                </a>
            </li>
        </c:if>
        <c:if test="${sessionScope.ACCOUNT.roleName == staff}">
            <li>
                <a href="viewMyOrder-staff?txtServiceID=2">
                    <i class="fas fa-chart-bar"></i>
                    <span>My Booking</span>
                </a>
            </li>
        </c:if>

        <c:if test="${sessionScope.ACCOUNT.roleName != staff}">
            <li>
                <a href="#">
                    <i class="fas fa-briefcase"></i>
                    <span>Account manager</span>
                </a>
            </li>
        </c:if>


        <c:if test="${sessionScope.ACCOUNT.roleName != staff}">
            <li>
                <a href="#">
                    <i class="fas fa-question-circle"></i>
                    <span>Products</span>
                </a>
            </li>
        </c:if>



        <li class="logout">
            <a href="guest?btAction=logout">
                <i class="fas fa-sign-out-alt"></i>
                <span>Logout</span>
            </a>
        </li>
    </ul>
</div>
