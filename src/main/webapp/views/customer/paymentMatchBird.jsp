

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Payment</title>
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
                                <a class="nav-link" style="color: #ffc107 ;margin: auto;" href="#">Tranport method</a>
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
        <form action="Checkout" class="container py-3 h-100 " method="post">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-12">
                    <div class="card card-registration card-registration-2" style="border-radius: 15px;">
                        <div class="card-body p-0">
                            <div class="row g-0">
                                <div class="col-lg-8">
                                    <div class="p-5">
                                        <div>
                                            <c:set var="customer" value="${sessionScope.CUSTOMER}"></c:set>
                                                <div class="d-flex justify-content-between align-items-center mb-3">
                                                    <h4 class="fw-bold mb-0 text-black">Information receive</h4>
                                                    <a href="shipping?txtServiceID=${sessionScope.SERVICE_ID}?txtTotalOrder=${sessionScope.TOTAL_ORDER}" class="change-icon text-decoration-none">
                                                    <h6 class="mb-0 text-muted change_info">Change information</h6>
                                                </a>
                                            </div>
                                            <div class="d-flex justify-content-between align-items-center mb-1">

                                                <h6 class="mb-0 text-muted ">${customer.fullName} - ${customer.phone_Number}</h6>
                                            </div>
                                            <div class="d-flex justify-content-between align-items-center">

                                                <h6 class="mb-0 text-muted ">${customer.address}, ${customer.city}</h6>
                                            </div>
                                            <!--                                            <div class="form-group mt-3">
                                                                                            <input type="text" class="form-control" id="exampleInputNote"
                                                                                                   placeholder="Note">
                                                                                        </div>-->
                                        </div>

                                        <hr class="my-4">

                                        <div class="d-flex justify-content-between align-items-center mb-3">
                                            <h4 class="fw-bold mb-0 text-black">Delivery method </h4>
                                        </div>

                                        <div class="row mb-4 d-flex justify-content-between align-items-center">
                                            <div class="form-check">
                                                <input onchange="submit()" class="form-check-input-2" type="radio" 
                                                       name="shippingMethod" id="exampleRadios1" value="Fast delivery" ${sessionScope.SHIPPING_METHOD == 'Fast delivery' ? 'checked' : ''}>
                                                <label class="form-check-label" for="exampleRadios1">
                                                    Fast delivery
                                                </label>
                                            </div>
                                            <div class="form-check fisrt-element">
                                                <input onchange="submit()" class="form-check-input-1" type="radio" 
                                                       name="shippingMethod" id="exampleRadios2" value="Receive directly at shop" ${sessionScope.SHIPPING_METHOD == 'Receive directly at shop' ? 'checked' : ''}>
                                                <label class="form-check-label" for="exampleRadios2">
                                                    Receive directly at shop
                                                </label>
                                                <c:if test="${SHIPPING_METHOD == 'Receive directly at shop'}">
                                                    <!--                                                    <div class="form-control justify-content-center"
                                                                                                             style="max-width: 300px;"
                                                                                                             id="datePickerDiv">
                                                                                                            <h6 class="" style="width: 100%;margin-left: 44px;">Enter the desired time</h6>
                                                                                                            <div class="d-flex">
                                                                                                                <div class="form-input-day">
                                                                                                                    <select name="txtDay" class="select-control text-muted" required>
                                                                                                                        <option label="Day"></option>
                                                    <c:forEach var="i" begin="${requestScope.DAY}" end="${requestScope.END_OF_MONTH - requestScope.DAY < 7 
                                                                                ?  requestScope.END_OF_MONTH : requestScope.DAY + 7 - requestScope.DAY_NEED}">
                                                        <option value="${i}">${i}</option>
                                                    </c:forEach>

                                                </select>
                                            </div>
                                            <div class="form-input-day">
                                                <select onchange="submit()" name="txtMonth" class="select-control text-muted">
                                                    <option value="${requestScope.MONTH}">${requestScope.MONTH}</option>
                                                    <c:if test="${requestScope.END_OF_MONTH - requestScope.DAY < 7 }">
                                                        <option value="${requestScope.MONTH + 1}">${requestScope.MONTH + 1}</option>
                                                    </c:if>
                                                </select>
                                            </div>
                                            <div class="form-input-day">
                                                <select name="txtYear" class="select-control text-muted">
                                                    <option value="${requestScope.YEAR}">${requestScope.YEAR}</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>-->
                                                </c:if>

                                            </div>
                                        </div>

                                        <hr class="my-4">

                                        <jsp:useBean id="util" class="Utils.FormatCurrency"></jsp:useBean>
                                            <div>
                                                <div class="d-flex justify-content-between align-items-center mb-3">
                                                    <h4 class="fw-bold mb-0 text-black">Payment method </h4>
                                                </div>

                                                <div class="row mb-4 d-flex justify-content-between align-items-center">

                                                    <div class="element-1  form-check">
                                                        <input name="PaymentMethod" class="form-check-input-2" type="radio"
                                                               id="COD" value="COD" checked>
                                                        <label class="form-check-label" for="COD">
                                                            Payment on delivery (COD)
                                                        </label>
                                                    </div>
                                                    <div class="form-check">
                                                        <input name="PaymentMethod" class="form-check-input-2" type="radio"
                                                               id="VNPAY" value="VNPAY">
                                                        <label class="form-check-label" for="VNPAY">
                                                            VNPAY online payment
                                                            (<a href="#" class="text-decoration-none text-muted">Link VNPAY</a>)
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>

                                            <hr class="my-4">

                                            <div class="pt-5">
                                                <h6 class="mb-0"><a href="#!" class="text-body"><i
                                                            class="fas fa-long-arrow-alt-left me-2"></i>Back</a>
                                                </h6>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 bg-grey">
                                        <div class="p-5">
                                            <div class="Promotion-received-element d-flex justify-content-between ">
                                                <h6>Service: Pair shop birds upon request</h6>
                                            </div>
                                        <c:set var="bird_nest_tracking" value="${sessionScope.BIRD_NEST_TRACKING}"></c:set>
                                            <div class="Promotion-received-element d-flex justify-content-between ">
                                                <h6>Male baby bird: ${bird_nest_tracking.male_Babybird} x ${util.FormatPrice(sessionScope.PRICE_MALE_BABY_BIRD)}</h6>
                                            <c:set var="maleBabyPrice" value="${bird_nest_tracking.male_Babybird * sessionScope.PRICE_MALE_BABY_BIRD}"></c:set>
                                            </div>
                                            <div class="Promotion-received-element d-flex justify-content-between ">
                                                <h6>Female baby bird: ${bird_nest_tracking.female_Babybird} x ${util.FormatPrice(sessionScope.PRICE_FEMALE_BABY_BIRD)}</h6>
                                            <c:set var="femaleBabyPrice" value="${bird_nest_tracking.female_Babybird * sessionScope.PRICE_FEMALE_BABY_BIRD}"></c:set>
                                            </div>

                                            <hr class="my-4">
                                            <div class="d-flex justify-content-between mb-1">
                                                <h6 class="text-uppercase">Total amount:</h6>
                                                <h6>${util.FormatPrice(femaleBabyPrice + maleBabyPrice)}</h6>
                                            <input type="hidden" name="txtTotalOrder" value="${femaleBabyPrice + maleBabyPrice}"/>
                                        </div>

                                        <div class="d-flex justify-content-between mb-1">
                                            <h6 class="text-uppercase">Deposit amount:</h6>
                                            <h6 id="Ship">${util.FormatPrice(sessionScope.DEPOSIT_PRICE)}</h6>
                                        </div>
                                        <div class="d-flex justify-content-between mb-1">
                                            <h6 class="text-uppercase">TRANSPORT FEE:</h6>
                                            <h6 id="Ship">${util.FormatPrice(sessionScope.SHIPPING_CASH)}</h6>
<!--                                            <input type="hidden" name="txtShippingCash" value="${sessionScope.SHIPPING_CASH}"/>-->
                                        </div>

                                        <div class="d-flex justify-content-between mb-2">
                                            <h5 class="text-uppercase">Remaining amount:</h5>

                                            <h5 id="total_order">${util.FormatPrice(femaleBabyPrice + maleBabyPrice + sessionScope.SHIPPING_CASH - sessionScope.DEPOSIT_PRICE)}</h5>
                                            <input name="total_order_final" type="hidden" value="${femaleBabyPrice + maleBabyPrice + sessionScope.SHIPPING_CASH - sessionScope.DEPOSIT_PRICE}">
                                        </div>
                                        <input type="hidden" name="txtOrderID" value="${sessionScope.OLD_ORDER_ID}" />
                                        <input type="hidden" name="txtServiceID" value="0" />
                                        <input name="btAction" value="Order" type="submit" class="btn btn-dark btn-block btn-lg"
                                               data-mdb-ripple-color="dark" 
                                               style="background-color:rgb(13,103,128) ;"/>
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
            function submit()
            {
                document.querySelector(".myForm").onsubmit();
            }
        </script>
    </body>

</html>
