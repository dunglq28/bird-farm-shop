
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
        <link rel="stylesheet" href="./assets/css/auth.css" type="text/css">
        <link rel="stylesheet" href="./assets/css/homePage.css">
    </head>
    <body>
        <jsp:include page="/components/header.jsp"></jsp:include>
            <div class="container-form">
                <div class="box">
                    <div class="header-form">
                        <div class="header-form-title">Sign Up</div>
                    </div>


                    <form action="sign-up" method="POST">
                    <c:set var="err" value="${requestScope.CREATE_ERROR}"/>
                    <c:set var="email" value="${sessionScope.EMAIL}"/>
                    <c:set var="fullname" value="${sessionScope.USERNAME}"/>   

                    <div class="input-box">
                        <input name="txtEmail" value="${email}" type="text" class="input-field" id="email" autocomplete="off">
                        <label for="email">Email address</label><br>
                        <c:if test="${not empty err.emptyEmail}">
                            <p class="input-error">${err.emptyEmail}</p>
                        </c:if>
                        <c:if test="${not empty err.wrongEmail}">
                            <p class="input-error">${err.wrongEmail}</p>
                        </c:if>
                        <c:if test="${not empty err.isExistEmail}">
                            <p class="input-error">${err.isExistEmail}</p>
                        </c:if>
                    </div>

                    <div class="input-box">
                        <div class="form-vertify">
                            <input name="txtVerification" type="text" class="input-field" autocomplete="off" placeholder="Verification codes">
                            <button name="btAction" value="Send" class="form-getcode">Send</button>
                        </div>
                        <c:if test="${not empty err.emptyVerification}">
                            <p class="input-error">${err.emptyVerification}</p>
                        </c:if>
                        <c:if test="${not empty err.wrongVerification}">
                            <p class="input-error">${err.wrongVerification}</p>
                        </c:if>
                    </div>

                    <div class="input-box">
                        <input name="txtPassword" type="password" class="input-field" id="password" autocomplete="off">
                        <label for="password">Password</label>
                        <c:if test="${not empty err.emptyPassword}">
                            <p class="input-error">${err.emptyPassword}</p>
                        </c:if>
                        <c:if test="${not empty err.wrongPassword}">
                            <p class="input-error">${err.wrongPassword}</p>
                        </c:if>
                    </div> 

                    <div class="input-box">
                        <input name="txtFullName" value="${fullname}" type="text" class="input-field" autocomplete="off">
                        <label>FullName</label>
                        <c:if test="${not empty err.emptyFullName}">
                            <p class="input-error">${err.emptyFullName}</p>
                        </c:if>
                    </div> 

                    <div class="form-gender">
                        <div>
                            <input id="male" checked="" name="txtGender" type="radio" value="Male" autocomplete="off">
                            <label for="male" class="radio-text">Male</label>
                        </div>
                        <div>
                            <input id="female" name="txtGender" type="radio" value="" class="Female" autocomplete="off">
                            <label for="female" class="radio-text">Female</label>
                        </div>
                    </div>

                    <div class="form-birthday grid__row">
                        <div class="grid__column-4">
                            <select name="txtDay"  class="select-control" ${not empty sessionScope.CODE ? 'required""' : ""} >
                                <option label="Day"></option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                                <option value="25">25</option>
                                <option value="26">26</option>
                                <option value="27">27</option>
                                <option value="28">28</option>
                                <option value="29">29</option>
                                <option value="30">30</option>
                                <option value="31">31</option>
                            </select>

                        </div>
                        <div class="grid__column-4">
                            <select name="txtMonth" class="select-control" ${not empty sessionScope.CODE ? 'required""' : ""}>
                                <option label="Month"></option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                            </select>
                        </div>
                        <div class="grid__column-4">
                            <select name="txtYear" class="select-control" ${not empty sessionScope.CODE ? 'required""' : ""}>
                                <option label="Year"></option>
                                <option value="2015">2016</option>
                                <option value="2015">2015</option>
                                <option value="2014">2014</option>
                                <option value="2013">2013</option>
                                <option value="2012">2012</option>
                                <option value="2011">2011</option>
                                <option value="2010">2010</option>
                                <option value="2009">2009</option>
                                <option value="2008">2008</option>
                                <option value="2007">2007</option>
                                <option value="2006">2006</option>
                                <option value="2005">2005</option>
                                <option value="2004">2004</option>
                                <option value="2003">2003</option>
                                <option value="2002">2002</option>
                                <option value="2001">2001</option>
                                <option value="2000">2000</option>
                                <option value="1999">1999</option>
                                <option value="1998">1998</option>
                                <option value="1997">1997</option>
                                <option value="1996">1996</option>
                                <option value="1995">1995</option>
                                <option value="1994">1994</option>
                                <option value="1993">1993</option>
                                <option value="1992">1992</option>
                                <option value="1991">1991</option>
                                <option value="1990">1990</option>
                                <option value="1989">1989</option>
                                <option value="1988">1988</option>
                                <option value="1987">1987</option>
                                <option value="1986">1986</option>
                                <option value="1985">1985</option>
                                <option value="1984">1984</option>
                                <option value="1983">1983</option>
                                <option value="1982">1982</option>
                                <option value="1981">1981</option>
                                <option value="1980">1980</option>
                                <option value="1979">1979</option>
                                <option value="1978">1978</option>
                                <option value="1977">1977</option>
                                <option value="1976">1976</option>
                                <option value="1975">1975</option>
                                <option value="1974">1974</option>
                                <option value="1973">1973</option>
                                <option value="1972">1972</option>
                                <option value="1971">1971</option>
                                <option value="1970">1970</option>
                                <option value="1969">1969</option>
                                <option value="1968">1968</option>
                                <option value="1967">1967</option>
                                <option value="1966">1966</option>
                                <option value="1965">1965</option>
                                <option value="1964">1964</option>
                                <option value="1963">1963</option>
                                <option value="1962">1962</option>
                                <option value="1961">1961</option>
                                <option value="1960">1960</option>
                                <option value="1959">1959</option>
                                <option value="1958">1958</option>
                                <option value="1957">1957</option>
                                <option value="1956">1956</option>
                                <option value="1955">1955</option>
                                <option value="1954">1954</option>
                                <option value="1953">1953</option>
                                <option value="1952">1952</option>
                                <option value="1951">1951</option>
                                <option value="1950">1950</option>
                            </select>
                        </div>
                    </div>

                    <div class="input-box">
                        <br><input name="btAction" value="Sign up" type="submit" class="input-submit" value="Sign Up">
                    </div>
                </form>


                <div class="middle-text">
                    <hr>
                    <p class="or-text">Or</p>
                </div>
                <div class="social-sign-in">
                    <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&redirect_uri=http://localhost:8084/BirdFarmShop/login-google&response_type=code
                       &client_id=1070154375273-hib2mbbkpbb47ral7kt3s763c25piprp.apps.googleusercontent.com&approval_prompt=force" class="input-google">
                        <img src="./assets/image/Auth_images/google.jpg" alt="">
                        <p>Google</p>
                    </a>
                    <a href="https://www.facebook.com/dialog/oauth?client_id=318980067328061&
                       redirect_uri=http://localhost:8084/BirdFarmShop/login-facebook" class="input-facebook">
                        <img src="./assets/image/Auth_images/facebook.png" alt="">
                        <p>Facebook</p>
                    </a>
                </div>
                <div class="sign-up">
                    <p>Already have a account ? <a href="guest?btAction=loginPage">Sign in</a></p>
                </div>
            </div>
        </div>
        <jsp:include page="/components/footer.jsp"></jsp:include>
    </body>
</html>
