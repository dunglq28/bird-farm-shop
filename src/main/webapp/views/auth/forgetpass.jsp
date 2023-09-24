<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Forget Password Page</title>
        <link rel="stylesheet" href="./assets/css/auth.css" type="text/css">
    </head>

    <body>
        <c:set var="notification" value="${requestScope.NOTIFICATION}"/>
        <div class="box">
            <div class="header">
                <header>Password retrieval</header>
            </div>
            <form action="guest" autocomplete="off" method="GET">
                <c:set var="err" value="${requestScope.CREATE_ERROR}"/>
                <div class="input-box">
                    <input name="txtContact" value="${param.txtContact}" type="text" class="input-field" id="email" autocomplete="off">
                    <label for="email">Email address</label>
                    <c:if test="${not empty err.emptyEmail}">
                        <p class="login-error">${err.emptyEmail}</p>
                    </c:if>
                    <c:if test="${not empty err.wrongEmail}">
                        <p class="input-error">${err.wrongEmail}</p><br>
                    </c:if>
                </div>

                <div class="input-box">
                    <input name="btAction" value="Send" type="submit" class="input-submit" >
                    <c:if test="${not empty notification}">
                        <h3 style="color: green">Successfully!</h3>
                    </c:if>
                </div>
            </form>
        </div>
        <c:if test="${not empty notification}">
            <script>
                alert("${notification}");
            </script>
        </c:if>
    </body>

</html>