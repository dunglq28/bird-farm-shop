

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
        <form action="Checkout" class="container py-3 h-100 " method="POST">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-12">
                    <div class="card card-registration card-registration-2" style="border-radius: 15px;">
                        <div class="card-body p-0">
                            <div class="row g-0">
                                <div class="col-lg-8">
                                    <div class="p-5">
                                        <div>
                                            <c:set var="customer" value="${requestScope.CUSTOMER}"></c:set>
                                                <div class="d-flex justify-content-between align-items-center mb-3">
                                                    <h4 class="fw-bold mb-0 text-black">Information receive</h4>
                                                    <a href="#" class="change-icon text-decoration-none">
                                                        <h6 class="mb-0 text-muted ">Change information</h6>
                                                    </a>
                                                </div>
                                                <div class="d-flex justify-content-between align-items-center mb-1">

                                                    <h6 class="mb-0 text-muted ">${customer.fullName} - ${customer.phone_Number}</h6>
                                            </div>
                                            <div class="d-flex justify-content-between align-items-center">

                                                <h6 class="mb-0 text-muted ">${customer.address}, ${customer.city}</h6>
                                            </div>
                                            <div class="form-group mt-3">
                                                <input type="text" class="form-control" id="exampleInputNote"
                                                       placeholder="Note">
                                            </div>
                                        </div>

                                        <hr class="my-4">

                                        <div class="d-flex justify-content-between align-items-center mb-3">
                                            <h4 class="fw-bold mb-0 text-black">Shipping method </h4>
                                        </div>

                                        <div class="row mb-4 d-flex justify-content-between align-items-center">
                                            <div class="form-check">
                                                <input onchange="submit()" class="form-check-input-2" type="radio" 
                                                       name="shippingMethod" id="exampleRadios1" value="Fast delivery" ${SHIPPING_METHOD == 'Fast delivery' ? 'checked' : ''}>
                                                <label class="form-check-label" for="exampleRadios1">
                                                    Fast delivery
                                                </label>
                                            </div>
                                            <div class="form-check fisrt-element">
                                                <input onchange="submit()" class="form-check-input-1" type="radio" 
                                                       name="shippingMethod" id="exampleRadios2" value="Receive directly at shop" ${SHIPPING_METHOD == 'Receive directly at shop' ? 'checked' : ''}>
                                                <label class="form-check-label" for="exampleRadios2">
                                                    Receive directly at shop
                                                </label>
                                                <c:if test="${SHIPPING_METHOD == 'Receive directly at shop'}">
                                                    <div class="form-control justify-content-center"
                                                         style="max-width: 300px;"
                                                         id="datePickerDiv">
                                                        <h6 class="" style="width: 100%;margin-left: 44px;">Enter the desired time</h6>
                                                        <div class="d-flex">
                                                            <div class="form-input-day">
                                                                <select name="txtDay" class="select-control text-muted" required>
                                                                    <option label="Day"></option>
                                                                    <c:forEach var="i" begin="${requestScope.DAY}" end="${requestScope.DAY + 7}">
                                                                        <option value="${i}">${i}</option>
                                                                    </c:forEach>

                                                                </select>
                                                            </div>
                                                            <div class="form-input-day">
                                                                <select name="txtMonth" class="select-control text-muted">
                                                                    <option value="${requestScope.MONTH}">${requestScope.MONTH}</option>
                                                                </select>
                                                            </div>
                                                            <div class="form-input-day">
                                                                <select name="txtYear" class="select-control text-muted">
                                                                    <option value="${requestScope.YEAR}">${requestScope.YEAR}</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
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
                                            <div class="d-flex justify-content-between align-items-center mb-3">
                                                <h4 class="fw-bold mb-0 text-black">Order</h4>
                                                <a href="#" class="change-icon change-infor-link text-decoration-none">
                                                    <h6 class="mb-0 text-muted ">Update</h6>
                                                </a>
                                            </div>
                                            <hr class="my-4">
                                        <c:set var="cart" value="${sessionScope.BIRD_CART}" />
                                        <c:if test="${not empty cart}"> 
                                            <c:set var="items" value="${cart.items}"></c:set>
                                            <c:if test="${not empty items}">
                                                <c:forEach items="${items.keySet()}" var="key" varStatus="counter">
                                                    <c:if test="${counter.count > 1}"><hr></c:if>
                                                        <div class="row mb-12 d-flex justify-content-between align-items-center">
                                                            <div class="col-md-4">
                                                                <img src="${items.get(key).image}"
                                                                 class="img-fluid rounded-3" alt="Bird Image">
                                                        </div>
                                                        <div class="col-md-8 justify-content-center">
                                                            <h5 class="text-black mb-0">${items.get(key).bird_Name}</h5>
                                                            <div class="d-flex justify-content-between align-items-center mb-3">
                                                                <h6 class="mb-0 text-muted ">Qty: ${items.get(key).quantity_Buy}</h6>
                                                                <a href="#" class="change-infor-link text-decoration-none">
                                                                    <h6 class="mb-0 text-muted ">x${items.get(key).priceFormat}</h6>
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </c:if>
                                        </c:if>

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
                                        <!--                                        <div class="mb-4">
                                        
                                        
                                                                                    <div class="Promotion-received-element">
                                                                                        <h6>Voucher: Discount 10%</h6>
                                                                                    </div>
                                        
                                                                                </div>-->


                                        <hr class="my-4">
                                        <div class="d-flex justify-content-between mb-1">
                                            <h6 class="text-uppercase">Temporary</h6>
                                            <h6>${util.FormatPrice(requestScope.TOTAL_ORDER)}</h6>
                                            <input type="hidden" name="txtTotalOrder" value="${requestScope.TOTAL_ORDER}"/>
                                        </div>

                                        <div class="d-flex justify-content-between mb-1">
                                            <h6 class="text-uppercase">Tranport Fee</h6>
                                            <h6 id="Ship">${util.FormatPrice(requestScope.SHIPPING_CASH)}</h6>
                                            <input type="hidden" name="txtShippingCash" value="${requestScope.SHIPPING_CASH}"/>
                                        </div>
                                        <div class="d-flex justify-content-between mb-3">
                                            <h6 class="text-uppercase">discount</h6>
                                            <h6>0</h6>
                                        </div>
                                        <div class="d-flex justify-content-between mb-2">
                                            <h5 class="text-uppercase">Total price</h5>

                                            <h5 id="total_order">${util.FormatPrice(requestScope.TOTAL_ORDER - requestScope.TOTAL_ORDER * 0 + requestScope.SHIPPING_CASH)}</h5>
                                        </div>

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
