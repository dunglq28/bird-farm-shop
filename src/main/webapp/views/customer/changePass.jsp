<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Change password</title>

        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <style>

        </style>
    </head>

    <body>
        <div class="container mt-5">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <h2 class="text-center" style="color: #0D6780;">Change password</h2>
                    <form action="">
                        <c:set var="err" value="${requestScope.CHANGE_ERROR}"/>
                        <div class="form-group">
                            <input type="text" class="form-control text-muted" id="name" value="${sessionScope.ACCOUNT.fullName}" disabled>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control text-muted" id="oldPassword" name="password" placeholder="Enter new password">
                            <c:if test="${not empty err.emptyPassword}">
                            <p class="input-error">${err.emptyPassword}</p>
                        </c:if>
                        <c:if test="${not empty err.wrongPassword}">
                            <p class="input-error">${err.wrongPassword}</p>
                        </c:if>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control text-muted" id="newPassword" name="confirm_password" placeholder="Confirm new password">
                              <c:if test="${not empty err.confirmError}">
                            <p class="input-error">${err.confirmError}</p>
                        </c:if>
                        </div>
                        <button type="submit" class="btn btn-primary mt-3" style="background: #0D6780;">Submit</button>
                    </form>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>

</html>
