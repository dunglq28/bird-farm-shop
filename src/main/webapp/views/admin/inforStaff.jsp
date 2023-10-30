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

        <title>Admin</title>

    </head>
    <body>
        <jsp:useBean id="util" class="Utils.FormatCurrency"></jsp:useBean>
        <jsp:include page="/components/siveBar.jsp"></jsp:include>

            <div class="main--content">
                <div class="header-wrapper">
                    <div class="header--title">
                        <span>Primary</span>
                        <h2>Account Management</h2>
                    </div>
                    <div class="user--info">
                        <div class="search--box">
                            <i class="fa-solid fa-search"></i>
                            <input type="text" placeholder="search" />
                        </div>
                    ${sessionScope.ACCOUNT.fullName}
                </div>
            </div>
            <div class="tabular--wrapper">

                <h3 class="main--title">Account</h3>

                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>Account ID</th>
                                <th>Full Name</th>
                                <th>Role Name</th>
                                <th>Email</th>
                                <th>Date created</th>
                                <th>Created By</th>
                                <th>Status</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set var="admin" value="Admin"/>
                        <div class="tbody-wrapper">
                            <c:set var="acc" value="${requestScope.ACCOUNT_LIST}"></c:set>
                            <c:if test="${not empty acc}">
                                <c:forEach items="${acc}" var="dto">
                                    <tr>
                                        <c:if test="${dto.roleName != admin}">
                                            <td>${dto.accountID}</td>
                                            <td>${dto.fullName}</td>
                                            <td>${dto.roleName}</td>
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
                                        </c:if>
                                    </tr>
                                </c:forEach>
                            </c:if>
                        </div>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>