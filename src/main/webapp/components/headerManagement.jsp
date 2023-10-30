<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="header-wrapper">
    <div class="header--title">
        <span>Primary</span>
        <c:if test="${sessionScope.CURRENT_VIEW == 'All account'}">
            <h2>Account Management</h2>
        </c:if>
        <c:if test="${sessionScope.CURRENT_VIEW != 'All account'}">
            <h2>Order Management</h2>
        </c:if>
    </div>
    <div class="user--info">
        <form action="${sessionScope.CURRENT_VIEW == 'All account' ? 'viewAllAccount' : 'viewNewOrder'}" class="search--box">
            <i class="fa-solid fa-search"></i>
            <input name="txtSearch" value="${param.txtSearch}" type="text" placeholder="Search" />
            <button type="submit"></button>
        </form>
        ${sessionScope.ACCOUNT.fullName}
    </div>
</div>