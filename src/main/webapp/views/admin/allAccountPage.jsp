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
        <link rel="stylesheet" href="./assets/css/dashboard.css" />
        <link rel="stylesheet" href="./assets/css/homePage.css">

        <title>Accounts</title>

    </head>
    <body>
        <jsp:useBean id="util" class="Utils.FormatCurrency"></jsp:useBean>
        <jsp:include page="/components/sideBar.jsp"></jsp:include>
            <div class="main--content">
                <div class="header-wrapper">
                    <div class="header--title">
                        <span>Primary</span>
                        <h2>Account Management</h2>
                    </div>
                    <div class="user--info">
                        <form action="viewAllAccount" class="search--box">
                            <i class="fa-solid fa-search"></i>
                            <input name="lastSearch" value="${param.lastSearch}" type="text" placeholder="Search" />
                        <button type="submit"></button>
                    </form>
                    ${sessionScope.ACCOUNT.fullName}
                </div>
            </div>
            <div class="tabular--wrapper">

                <h3 class="main--title">Account</h3>

                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th >Account ID</th>
                                <th >Full Name</th>
                                <th >Role Name</th>
                                <th class="text-center">Email</th>
                                <th >Date created</th>
                                <th >Created By</th>
                                <th class="text-center">Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set var="admin" value="Admin"/>
                        <div class="tbody-wrapper">
                            <c:set var="acc" value="${requestScope.ACCOUNT_LIST}"></c:set>
                            <c:if test="${not empty acc}">
                                <c:forEach items="${acc}" var="dto">
                                    <tr>
                                        <td>${dto.accountID}</td>
                                        <td>${dto.fullName}</td>
                                        <td>
                                            <form action="updatedAccountRoles">
                                                <select name="role" onchange="submit()" class="rounded-select" >
                                                    <option ${dto.roleName == 'Admin' ? 'selected' : '' }>Admin</option>
                                                    <option ${dto.roleName == 'Staff' ? 'selected' : '' }>Staff</option>
                                                    <option ${dto.roleName == 'Customer' ? 'selected' : '' }>Customer</option>
                                                </select>
                                                <input type="hidden" name="accountid" value="${dto.accountID}"/>
                                                <!--<input type="hidden" name="role" value="${dto.roleName}"/>-->
                                            </form>
                                        </td>
                                        <td>${dto.email}</td>
                                        <td>${util.FormatDate(dto.date_created)}</td>
                                        <td>${dto.createBy}</td>
                                        <td>
                                            <form action="updatedAccountStatus">
                                                <select name="status" onchange="submit()" class="rounded-select" >
                                                    <option ${dto.status == 'Enable' ? 'selected' : '' }>Enable</option>
                                                    <option ${dto.status == 'Disable' ? 'selected' : '' }>Disable</option>
                                                </select>
                                                <input type="hidden" name="accountID" value="${dto.accountID}" />
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                        </div>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-lg-12 text-center mt-2">
                <div class="pagination__option" style="text-align: end">
                    <c:if test="${not empty requestScope.SEARCH_VALUE}">
                        <c:set var="search" value="lastSearch=${requestScope.SEARCH_VALUE}"></c:set>
                    </c:if>
                    <c:if test="${requestScope.indexCurrent > 1}">
                        <a href="viewAllAccount?${search}&page=1"><i class="fa fa-angle-double-left"></i></a>
                        <a href="viewAllAccount?${search}&page=${requestScope.indexCurrent-1}"><i class="fa fa-angle-left"></i></a>
                        </c:if>

                    <c:forEach begin="${requestScope.START}" end="${requestScope.END}" var="i">
                        <a class="${requestScope.indexCurrent==i ? "active" : ""}" href="viewAllAccount?${search}&page=${i}">${i}</a>
                    </c:forEach>

                    <c:if test="${requestScope.indexCurrent<requestScope.endPage}">
                        <a href="viewAllAccount?${search}&page=${requestScope.indexCurrent+1}"><i class="fa fa-angle-right"></i></a>
                        <a href="viewAllAccount?${search}&page=${requestScope.endPage}"><i class="fa fa-angle-double-right"></i></a>
                        </c:if>
                </div>
            </div>  
        </div>
    </body>
</html>