<%-- 
    Document   : login
    Created on : Sep 22, 2023, 2:04:26 PM
    Author     : hj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign In</title>
        <link rel="stylesheet" href="./assets/css/login.css" type="text/css">
    </head>
    <body>
        <div class="login-box">
            <div class="login-header">
                <header>Sign In</header>
                <p>We are happy to have you back!</p>
            </div>
            <div class="input-box">
                <input type="text" class="input-field" id="email" autocomplete="off" required>
                <label for="email">Email or phone</label>
            </div>
            <div class="input-box">
                <input type="password" class="input-field" id="password" autocomplete="off" required>
                <label for="password">Password</label>
            </div>
            <div class="forgot">
                <section>
                    <input type="checkbox" id="check">
                    <label for="check">Remember me</label>
                </section>
                <section>
                    <a href="#" class="forgot-link">Forgot password?</a>
                </section>
            </div>
            <div class="input-box">
                <input type="submit" class="input-submit" value="Sign In">
            </div>
            <div class="middle-text">
                <hr>
                <p class="or-text">Or</p>
            </div>
            <div class="social-sign-in">
                <button class="input-google">
                    <img src="images/google.jpg" alt="">
                    <p>Google</p>
                </button>
                <button class="input-facebook">
                    <img src="images/facebook.png" alt="">
                    <p>Facebook</p>
                </button>
            </div>
            <div class="sign-up">
                <p>Don't have account <a href="#">Sign up</a></p>
            </div>
        </div>
    </body>
</html>
