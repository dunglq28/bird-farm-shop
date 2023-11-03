<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="sidebar">

    <div class="logo">Bird Farm Shop</div>    

    <c:set var="admin" value="Admin" />
    <c:set var="staff" value="Staff" />
    <c:set var="manager" value="Manager"/>
    <ul class="menu">
        <c:if test="${sessionScope.ACCOUNT.roleName != staff}">
            <li>
                <a href="#">
                    <i class="fas fa-tachometer-alt"></i>
                    <span>Dashboard</span>
                </a>
            </li>
        </c:if>
        <jsp:useBean id="oDao" class="Daos.OrderDAO"></jsp:useBean>
        <c:if test="${sessionScope.ACCOUNT.roleName == staff}">
            <li class="${sessionScope.CURRENT_VIEW == 'New order' ? 'active' : ''}">
                <a href="viewNewOrder" class="list-cart-icon">
                    <i class="fa-solid fa-cart-shopping"></i>
                    <span class="cart-number">${oDao.numberOfNewOrder}</span>
                    <span>Orders in queue</span>
                </a>
            </li>
        </c:if>
        <c:if test="${sessionScope.ACCOUNT.roleName == admin}">
            <li class="${sessionScope.CURRENT_VIEW == 'All order' ? 'active' : ''}">
                    <a href="viewAllOrder" class="list-cart-icon">
                        <i class="fa-solid fa-cart-shopping"></i>
                        <span class="cart-number">${oDao.numberOfAllOrder}</span>
                    <span>All Orders</span>
                </a>
            </li>
        </c:if>
        <c:if test="${sessionScope.ACCOUNT.roleName == staff}">
            <li class="${sessionScope.CURRENT_VIEW == 'My order' ? 'active' : ''}">
                <a href="viewMyOrder-staff?txtServiceID=1">
                    <i class="fa-solid fa-file-invoice"></i>
                    <span>My Order</span>
                </a>
            </li>
        </c:if>
        <c:if test="${sessionScope.ACCOUNT.roleName == staff}">
            <li class="${sessionScope.CURRENT_VIEW == 'My booking' ? 'active' : ''}">
                <a href="viewMyOrder-staff?txtServiceID=2">
                    <i class="fa-solid fa-file-invoice"></i>
                    <span>My Booking</span>
                </a>
            </li>
        </c:if>

        <c:if test="${sessionScope.ACCOUNT.roleName == admin}">
            <li class="${sessionScope.CURRENT_VIEW == 'All account' ? 'active' : ''}">
                <a href="viewAllAccount">
                    <i class="fas fa-briefcase"></i>
                    <span>Account manager</span>
                </a>
            </li>
        </c:if>


        <c:if test="${sessionScope.ACCOUNT.roleName == admin}">
            <li class="${sessionScope.CURRENT_VIEW == 'All product' ? 'active' : ''}">
                <a href="viewAllProduct">
                    <!--<i class="fas fa-question-circle"></i>-->
                    <span class="material-symbols-outlined">
                        raven
                    </span>
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
