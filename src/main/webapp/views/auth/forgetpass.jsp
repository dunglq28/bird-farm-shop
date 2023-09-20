<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Forget Password Page</title>
        <link rel="stylesheet" href="./assets/css/forgetpass.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <style>
            .login-error {
                color: red;
                font-size: 15px;
                margin-top: -18px;
                margin-left: 2px;
            }
        </style>
    </head>

    <body>
        <c:set var="notification" value="${requestScope.NOTIFICATION}"/>
        <div class="retrieval">
            <h1 class="retrieval-heading">Password retrieval</h1>
            <form action="guest" class="retrieval-form" autocomplete="off" method="GET"> 

                <c:set var="err" value="${requestScope.CREATE_ERROR}"/>

                <label for="email" class="retrieval-label">Enter your Email Address</label>
                <input name="txtContact" value="${param.txtContact}" type="email" id="email" class="password-input" placeholder="example@gmail.com">      
                <c:if test="${not empty err.emptyEmail}">
                    <p class="login-error">${err.emptyEmail}</p>
                </c:if>
                <c:if test="${not empty err.wrongEmail}">
                    <p class="login-error">${err.wrongEmail}</p><br>
                </c:if>
                <button name="btAction" value="Send"class="password-submit">Send</button>
                <c:if test="${not empty notification}">
                    <h2 style="color: green">Successfully!</h2>
                </c:if>
            </form>        
        </div>

        <c:if test="${not empty notification}">
            <script>
                alert("${notification}");
            </script>
        </c:if>
    </div>

</body>

</html>