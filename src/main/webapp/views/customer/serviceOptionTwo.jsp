<%-- 
    Document   : serviceOptionTwo
    Created on : Oct 17, 2023, 1:57:54 AM
    Author     : tt
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Based on the bird lists at shop</title>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="./assets/css/homePage.css">
        <link rel="stylesheet" href="./assets/css/payment.css">
    </head>
    <body>
        <!-- option2 -->
        <!-- header -->
        <div>
            <nav class="navbar navbar-expand-lg navbar-light bg-light"
                 style="background-color: rgb(13,103,128) !important;">
                <div class="col-md-6" style="margin: 0 10px 0 50px ;">
                    <a class="navbar-brand justify-content-center  " style="color: #fff !important;
                       font-size: 1.5em;
                       font-weight: 700;
                       text-transform: uppercase;
                       text-decoration: none;
                       padding-right: 10px;" href="home">Bird farm shop</a>
                </div>
                <div class="col-md-5">
                    <div class="collapse navbar-collapse" id="navbarText">
                        <ul class="navbar-nav mr-auto ">
                            <li class="nav-item active align-content-lg-end" style="display: flex;">
                                <a class="nav-link" style="color: #ffc107 ;margin: auto; align-items: center;"
                                   href="#">Login </a>
                            </li>
                            <li class="nav-item active align-content-lg-end material-symbols-outlined"
                                style="color: #ffc107 ; margin: auto 0; display: flex;">
                                arrow_forward
                            </li>

                            <li class="nav-item active align-content-lg-end" style="display: flex; max-width: auto;">
                                <a class="nav-link" style="color: #ffc107 ;margin: auto;" href="#">Receiving information</a>
                            </li>
                            <li class="nav-item active align-content-lg-end material-symbols-outlined"
                                style="color: #ffc107 ; margin: auto; display: flex;">
                                arrow_forward
                            </li>
                            <li class="nav-item" style="display: flex;">
                                <a class="nav-link" style="color: #ffc107 ;margin: auto;" href="#">Bird nest service</a>
                            </li>
                            <li class="nav-item active align-content-lg-end material-symbols-outlined"
                                style="color: #ffc107 ; margin: auto;">
                                arrow_forward
                            </li>
                            <li class="nav-item" style="display: flex;">
                                <a class="nav-link" style="color: #ffc107 ;margin: auto; " href="#">Pay</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-1"></div>
            </nav>
        </div>
        <!-- header -->
        <form action="Checkout"  class="container py-3 h-100 " method="POST">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-12">
                    <div class="card card-registration card-registration-2" style="border-radius: 15px;">
                        <div class="card-body p-0">
                            <div class="row g-0">
                                <div class="col-lg-8">
                                    <div class="p-5">
                                        <jsp:include page="/components/infoPayment.jsp"></jsp:include>
                                        <jsp:useBean id="utilPrice" class="Utils.FormatCurrency"></jsp:useBean>


                                            <hr class="my-4">

                                            <div>
                                                <div class="d-flex justify-content-between align-items-center mb-3">
                                                    <h4 class="fw-bold mb-0 text-black">Bird nest service</h4>
                                                </div>
                                                <div class="row">
                                                    <div class="col-5">
                                                        <label class="pay">Species*:</label>
                                                    </div>
                                                    <div class="col-7">
                                                        <select name="txtCateID" onchange="submit()" class="list-dt" required=""
                                                                style="border: 1px solid #a89a9a; color: #6c757d; text-align: center">
                                                            <option>Species</option>
                                                        <c:forEach var="cate" items="${sessionScope.ALL_CATE}">
                                                            <option ${requestScope.CATE_CHOOSE == cate.categoryID ? 'selected' : ''}
                                                                value="${cate.categoryID}">${cate.category_Name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="row" style="margin-top:10px">
                                                <div class="col-5">
                                                    <label class="pay">Parent bird*:</label>
                                                </div>
                                                <div class="col-7">
                                                    <select name="txtMaleBirdID"  onchange="submit()" class="list-dt" required=""
                                                            style="border: 1px solid #a89a9a; color: #6c757d; width: 40%; text-align: center">
                                                        <option selected>Male</option>
                                                        <c:forEach var="male_bird" items="${requestScope.MALE_BIRD}">
                                                            <option ${requestScope.MALE_BIRD_CHOOSE.productID == male_bird.productID ? 'selected' : ''}
                                                                value="${male_bird.productID}">${male_bird.product_Name}</option>
                                                        </c:forEach>
                                                    </select>

                                                    <select name="txtFemaleBirdID"  onchange="submit()"  class="list-dt"
                                                            style="border: 1px solid #a89a9a; color: #6c757d; margin-left: 30px; width: 40%; text-align: center">
                                                        <option selected>Female</option>
                                                        <c:forEach var="female_bird" items="${requestScope.FEMALE_BIRD}">
                                                            <option ${requestScope.FEMALE_BIRD_CHOOSE.productID == female_bird.productID ? 'selected' : ''}
                                                                value="${female_bird.productID}">${female_bird.product_Name}</option>
                                                        </c:forEach>
                                                    </select>

                                                </div>
                                            </div>
                                        </div>

                                        <hr class="my-4">
                                        <div class="d-flex justify-content-between align-items-center mb-3">
                                            <h4 class="fw-bold mb-0 text-black">Private and policy</h4>
                                        </div>
                                        <div class="">

                                            <h6 class="mb-0" style="color: #0D6780; font-weight: bold;">1. Get bird eggs
                                            </h6>
                                            </hr>
                                            <h7>- Only take the eggs; no father or mother birds are taken.
                                            </h7>
                                            <br>
                                            <h7>- Payment must be made in advance for the service at 4 million Vietnamese
                                                dong
                                                per month.</h7>
                                            <br>
                                            <h7>- The final total amount will be calculated by multiplying the number of
                                                months using the hybrid bird service by 4 million Vietnamese dong per month.
                                            </h7>
                                            <br>
                                            <h7>- Even if the customer cancels the service within the month, the store will
                                                still charge for the entire month (4 million Vietnamese dong).</h7></br>

                                            <h6 class="mb-0" style="color: #0D6780; font-weight: bold;">2. Get baby birds
                                            </h6>
                                            </hr>
                                            <h7>- Inherits the terms of 1</h7>
                                            <br>
                                            <h7>- Egg incubation fees:</h7>
                                            <ul>
                                                <li>
                                                    For 0 - 3 eggs: The price for incubating each egg is 2 million
                                                    Vietnamese
                                                    dong per month.
                                                </li>
                                                <li>For 4 - 7 eggs: The price for incubating each egg is 3 million
                                                    Vietnamese
                                                    dong per month.</li>
                                                <li>For 8 eggs and above: The price is 4 million Vietnamese dong per month.</li>
                                            </ul>
                                            <h7>- The total amount will be the egg incubation fee plus the hybrid bird
                                                service
                                                fee multiplied by the number of months using the service.</h7>
                                            <h6 class="mb-0" style="color: #0D6780; font-weight: bold;">3. Get bird eggs
                                                with parent</h6>
                                            </hr>
                                            <h7>- Inherits the terms of 1</h7>
                                            <br>
                                            <h7>- Upfront payment: Includes payment for father birds, mother birds, and one
                                                month of egg incubation (4 million Vietnamese dong).</h7>
                                            <br>
                                            <h7>- The total amount will be the upfront payment plus the hybrid bird service
                                                fee multiplied by the number of months using the hybrid bird service. If the
                                                customer cancels the service, the store will still retain the father and
                                                mother birds.</h7>

                                            <h6 class="mb-0" style="color: #0D6780; font-weight: bold;">4. Get baby birds
                                                with parent</h6>
                                            </hr>
                                            <h7>Inherits the terms of 1</h7>
                                            <br>
                                            <h7>Upfront payment: Includes payment for father birds, mother birds, and one
                                                month of egg incubation (4 million Vietnamese dong)</h7>
                                            <h7>- Egg incubation fees:</h7>

                                            <ul>
                                                <li>
                                                    For 0 - 3 eggs: The price for incubating each egg is 2 million
                                                    Vietnamese
                                                    dong per month.
                                                </li>
                                                <li>For 4 - 7 eggs: The price for incubating each egg is 3 million
                                                    Vietnamese
                                                    dong per month.</li>
                                                <li>For 8 eggs and above: The price is 4 million Vietnamese dong per month.
                                                </li>
                                            </ul>
                                            <h7>The total amount will be the upfront payment plus the hybrid bird service
                                                fee multiplied by the number of months using the service, egg incubation
                                                fee, father bird fee, and mother bird fee.</h7>
                                            <label class="container"
                                                   style="text-align:right; font-weight: bold; font-style: italic;">
                                                <input type="checkbox" required="">
                                                <span class="checkmark"></span>
                                                Agree to private and policy
                                            </label>

                                        </div>

                                        <hr class="my-4">

                                        <div class="pt-5">
                                            <h6 class="mb-0"><a href="Bird-Nest-Services" class="text-body"><i
                                                        class="fas fa-long-arrow-alt-left me-2"></i>Back</a>
                                            </h6>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 bg-grey">
                                    <div class="p-5">
                                        <div class="d-flex justify-content-between align-items-center mb-3">
                                            <h4 class="fw-bold mb-0 text-black">Order</h4>

                                        </div>
                                        <hr class="my-4">
                                        <c:set var="male_bird_choose" value="${requestScope.MALE_BIRD_CHOOSE}"></c:set>
                                        <c:if test="${not empty male_bird_choose}">
                                            <div class="row mb-12 my-3 d-flex justify-content-between align-items-center">
                                                <div class="col-md-4">
                                                    <img src="${male_bird_choose.image}"
                                                         class="img-fluid rounded-3" alt="Bird Image">
                                                </div>
                                                <div class="col-md-8 justify-content-center">
                                                    <h5 class="text-black mb-0">${male_bird_choose.product_Name}</h5>
                                                    <div class="d-flex justify-content-between align-items-center mb-0">
                                                        <h6 class="mb-0 text-muted ">Color: ${male_bird_choose.color}</h6>
                                                    </div>
                                                    <div class="d-flex justify-content-between align-items-center mb-0">
                                                         <h6 class="mb-0 text-muted ">Age: ${male_bird_choose.age}</h6>
                                                    </div>
                                                     <div class="d-flex justify-content-between align-items-center mb-0">
                                                        <h6 class="mb-0 text-muted ">${male_bird_choose.gender}</h6>
                                                    </div>
                                                     <div class="d-flex justify-content-between align-items-center mb-0">
                                                        <h6 class="mb-0 text-muted ">Price: ${utilPrice.FormatPrice(male_bird_choose.price)}</h6>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>


                                        <c:set var="female_bird_choose" value="${requestScope.FEMALE_BIRD_CHOOSE}"></c:set>
                                        <c:if test="${not empty female_bird_choose}">
                                            <div class="row mb-12 my-3 d-flex justify-content-between align-items-center">
                                                <div class="col-md-4">
                                                    <img src="${female_bird_choose.image}"
                                                         class="img-fluid rounded-3" alt="Bird Image">
                                                </div>
                                                <div class="col-md-8 justify-content-center">
                                                    <h5 class="text-black mb-0">${female_bird_choose.product_Name}</h5>
                                                    <div class="d-flex justify-content-between align-items-center mb-0">
                                                        <h6 class="mb-0 text-muted ">Color: ${female_bird_choose.color}</h6>
                                                    </div>
                                                    <div class="d-flex justify-content-between align-items-center mb-0">
                                                         <h6 class="mb-0 text-muted ">Age: ${female_bird_choose.age}</h6>
                                                    </div>
                                                     <div class="d-flex justify-content-between align-items-center mb-0">
                                                        <h6 class="mb-0 text-muted ">${female_bird_choose.gender}</h6>
                                                    </div>
                                                     <div class="d-flex justify-content-between align-items-center mb-0">
                                                        <h6 class="mb-0 text-muted ">Price: ${utilPrice.FormatPrice(female_bird_choose.price)}</h6>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>

                                        <div class="Promotion-received-element d-flex justify-content-between ">
                                            <h6>Service: ${requestScope.SERVICE_NAME}</h6>
                                        </div>
                                        <div class="d-flex justify-content-between align-items-center mb-0">
                                            <h6 class="mb-0 text-muted ">Deposit Price of the service: </h6>
                                            <a href="#" class="change-infor-link text-decoration-none">
                                                <h6 class="mb-0 text-muted ">x ${utilPrice.FormatPrice(requestScope.SERVICE_PRICE)}</h6>
                                            </a>
                                        </div>

                                        <hr class="my-4">

                                        <h5 class="text-uppercase mb-2">Voucher</h5>
                                        <div class="input-group rounded mb-3">
                                            <input type="search" class="form-control rounded"
                                                   placeholder="Enter your voucher" aria-label="Search"
                                                   aria-describedby="search-addon" />
                                            <span class="input-group-text border-0" id="search-addon">
                                                <a href="#"><i class="fas fa-search"></i></a>
                                            </span>
                                        </div>


                                        <hr class="my-4">

                                        <div class="d-flex justify-content-between mb-1">
                                            <h6 class="text-uppercase">Temporary</h6>
                                            <h6>${utilPrice.FormatPrice(requestScope.SERVICE_PRICE)}</h6>
                                        </div>
                                        <div class="d-flex justify-content-between mb-1">
                                            <h6 class="text-uppercase">Transport Fee</h6>
                                            <h6 id="Ship">${utilPrice.FormatPrice(sessionScope.SHIPPING_CASH)}</h6>
                                        </div>
                                        <div class=" d-flex justify-content-between mb-3">
                                            <h6 class="text-uppercase">discount</h6>
                                            <h6>0</h6>
                                        </div>
                                        <c:set var="total_order" value="${sessionScope.SHIPPING_CASH + requestScope.SERVICE_PRICE}"></c:set>
                                            <div class="d-flex justify-content-between mb-2">
                                                <h5 class="text-uppercase">Total price</h5>
                                                <h5 id="total_order">${utilPrice.FormatPrice(total_order)}</h5>
                                        </div>
                                        <input type="hidden" name="txtTotalOrder" value="${requestScope.SERVICE_PRICE}" />
                                        <input type="hidden" name="total_order_final" value="${total_order}" />
                                        <input type="hidden" name="txtServiceID" value="${sessionScope.SERVICE_ID}" />
                                        <input name="btAction" value="Order" type="submit" 
                                               ${not empty male_bird_choose && not empty female_bird_choose ? '' : 'disabled'}
                                               class="btn btn-dark btn-block btn-lg" data-mdb-ripple-color="dark"
                                               style="background-color:rgb(13,103,128) ;" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </form>

        <!-- footer -->
        <jsp:include page="/components/footer.jsp"></jsp:include>
        <!-- close footer -->
        <script>
            function submit() {
                document.querySelector(".myForm").onsubmit();
            }
        </script>
    </body>
</html>
