
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
        <link rel="stylesheet" href="./assets/css/cart.css">
        <link rel="stylesheet" href="./assets/css/homePage.css">

        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    </head>
    <body>
        <jsp:include page="/components/header.jsp"></jsp:include>

        <jsp:useBean id="util" class="Utils.FormatCurrency"></jsp:useBean>
        <c:set var="cart" value="${sessionScope.BIRD_CART}" />
        <c:if test="${not empty cart}"> 
            <c:set var="items" value="${cart.items}"></c:set>
            <c:if test="${not empty items}">
                <div class="container py-5 h-100 ">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col-12">
                            <div class="card card-registration card-registration-2" style="border-radius: 15px;">
                                <div class="card-body p-0">
                                    <div class="row g-0">
                                        <div class="col-lg-8">
                                            <div class="p-5">
                                                <div class="d-flex justify-content-between align-items-center mb-5">
                                                    <h1 class="fw-bold mb-0 text-black">Shopping Cart</h1>
                                                    <h6 class="mb-0 text-muted">${sessionScope.CART_QUANTITY_PRODUCT} product</h6>
                                                </div>
                                                <div class="mb-4 d-flex justify-content-between align-items-center">
                                                    <h6 class="fw-bold col-md-6  text-muted">Product</h6>
                                                    <h6 class="fw-bold col-md-2  text-sm-center text-muted ">Price</h6>
                                                    <h6 class="fw-bold col-md-2  text-center text-muted ">Quantity</h6>
                                                    <h6 class="fw-bold col-md-2  text-center text-muted">Total</h6>
                                                </div>

                                                <c:forEach items="${items.keySet()}" var="key" >
                                                    <hr class="my-4">
                                                    <div class="product-element">
                                                        <div class="row mb-4 d-flex justify-content-between align-items-center">
                                                            <div class="col-md-2 col-lg-2 col-xl-2">
                                                                <img src="${items.get(key).image}"
                                                                     class="img-fluid rounded-3" alt="Bird Image">
                                                            </div>
                                                            <div class="col-md-4 col-lg-4 col-xl-4">
                                                                <h6 class="text-black mb-0">${items.get(key).bird_Name} </h6>
                                                                <h6 class="text-muted">${items.get(key).category_Name} </h6> 
                                                                <div class="d-flex">
                                                                    <h6 class="text-muted">Age: ${items.get(key).age}</h6>
                                                                    <h6 class="mb-0 text-sm-center text-muted"
                                                                        style="margin: 0 10px 0 10px;"> |
                                                                    </h6>
                                                                    <h6 class="text-muted">Gender: ${items.get(key).gender}</h6>
                                                                </div>


                                                                <h6 class="text-muted">Color: ${items.get(key).color}</h6>
                                                                <div class="delete-product mb-1">
                                                                    <a href="remove-bird?BirdID=${key}" class="delete-icon text-decoration-none ">
                                                                        <i class="fa-sharp fa-solid fa-xmark fa-lg"></i>
                                                                        Delete
                                                                    </a>
                                                                </div>                                                             

                                                            </div>
                                                            <div class="col-md-2 col-lg-2 col-xl-2 ">
                                                                <h6 class="mb-0 text-sm-center">${items.get(key).priceFormat}</h6>
                                                                <!--<h6 class="mb-0 text-sm-center text-muted origin-price">${items.get(key).priceFormat}</h6>-->
                                                            </div>
                                                            <div class="col-md-2 col-lg-2 col-xl-2 d-flex align-items-center quantity-form">
                                                                <form action="cart" method="POST" style="display: flex">

                                                                    <button name="btn" value="des" class="btn btn-link px-2 text-muted"
                                                                            onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                                                        <i class="fas fa-minus"></i>
                                                                    </button>
                                                                    <input id="form1" name="txtQuantityBuy" value="${items.get(key).quantity_Buy}" type="text"
                                                                           class="form-control form-control-sm button-input"x   />
                                                                    <input name="txtBirdID" value="${key}" type="hidden" />
                                                                    <input name="txtQuantityAvailable" value="${items.get(key).quantity_Available}" type="hidden" />
                                                                    <button name="btn" value="inc" class="btn btn-link px-2 text-muted"
                                                                            onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                                                        <i class="fas fa-plus"></i>
                                                                    </button>
                                                                </form>
                                                            </div>

                                                            <div
                                                                class="col-md-2 col-lg-2 col-xl-2 text-md-end text-lg-start text-xl-start">
                                                                <h6 class="mb-0">${util.FormatPrice(items.get(key).price * items.get(key).quantity_Buy)}</h6>
                                                                <c:set var="total_field" value="${items.get(key).price * items.get(key).quantity_Buy}" ></c:set>

                                                                </div>
                                                            </div>
                                                        <c:set var="total_order" value="${totalOrder = totalOrder + total_field}" ></c:set>
                                                            <!--                                                    <div class="row mb-4 d-flex justify-content-between align-items-center">
                                                            
                                                                                                                    <div class="form-check">
                                                                                                                        <input class="form-check-input" type="radio" name="exampleRadios"
                                                                                                                               id="exampleRadios1" value="option1" checked>
                                                                                                                        <label class="form-check-label" for="exampleRadios1">
                                                                                                                            Gift: bird food (500g)
                                                                                                                        </label>
                                                                                                                    </div>
                                                                                                                    <div class="form-check">
                                                                                                                        <input class="form-check-input" type="radio" name="exampleRadios"
                                                                                                                               id="exampleRadios2" value="option2">
                                                                                                                        <label class="form-check-label" for="exampleRadios2">
                                                                                                                            Gift: 50% discount voucher for your next purchase
                                                                                                                        </label>
                                                                                                                    </div>
                                                                                                                    <div class="form-check">
                                                                                                                        <input class="form-check-input" type="radio" name="exampleRadios"
                                                                                                                               id="exampleRadios3" value="option3">
                                                                                                                        <label class="form-check-label" for="exampleRadios3">
                                                                                                                            Gift: free bird care voucher
                                                                                                                        </label>
                                                                                                                    </div>
                                                            
                                                                                                                </div>-->
                                                        </div>
                                                </c:forEach>

                                                <!--<hr class="my-4">-->

                                                <hr class="my-4">

                                                <div class="pt-5">
                                                    <h6 class="mb-0"><a href="product-list" class="text-body"><i
                                                                class="fas fa-long-arrow-alt-left me-2"></i>Back to shop</a>
                                                    </h6>
                                                </div>
                                            </div>
                                        </div>
                                        <form action="Checkout" class="col-lg-4 bg-grey" method="POST">
                                            <div class="p-5">
                                                <h3 class="fw-bold mb-5 mt-2 pt-1">Summary</h3>
                                                <hr class="my-4">

                                                <div class="d-flex justify-content-between mb-4">
                                                    <h5 class="text-uppercase">Total</h5>
                                                    <h5>${util.FormatPrice(total_order)}</h5>
                                                </div>

                                                <div class="d-flex justify-content-between mb-4">
                                                    <h5 class="text-uppercase">Discount</h5>
                                                    <h5>0</h5>
                                                </div>
                                                <div class=" justify-content-between mb-4">
                                                    <h5 class="text-uppercase mb-0">Gift include</h5>
                                                    <div class="mt-2">
                                                        <h6 class="mb-0 text-muted ">Gift: Tâm Béo </h6>
                                                        <h6 class="mb-0 text-muted ">Gift: Tâm Béo </h6>
                                                        <h6 class="mb-0 text-muted ">Gift: Tâm Béo </h6>
                                                    </div>


                                                </div>


                                                <!--                                            <div class="mb-5">
                                                
                                                                                                <div class="Promotion-received"></div>
                                                
                                                                                                <div class="Promotion-received-element">
                                                                                                    <h6>Gift: bird food (500g)</h6>
                                                                                                </div>
                                                                                                <div class="Promotion-received-element">
                                                                                                    <h6>Gift: 50% discount voucher for your next purchase</h6>
                                                                                                </div>
                                                                                                <div class="Promotion-received-element">
                                                                                                    <h6>Gift: free bird care voucher</h6>
                                                                                                </div>
                                                
                                                
                                                                                            </div>-->

                                                <hr class="my-4">
                                                <div class="d-flex justify-content-between mb-5">
                                                    <h5 class="text-uppercase">Total price</h5>
                                                    <h5>${util.FormatPrice(total_order)}</h5>
                                                    <input type="hidden" name="txtTotalOrder" value="${total_order}" />
                                                </div>
                                                <input value="Buy Now" type="submit" class="btn-buy btn btn-dark btn-block btn-lg"
                                                       data-mdb-ripple-color="dark">
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>
        </c:if>
        <c:if test="${empty items}">
            <div class="container-fluid  mt-100 vh-100 justify-content-center align-content-center" style="margin:auto">
                <div class="row">

                    <div class="col-md-12" style="margin-top: 80px;">

                        <div class="card">
                            <div class="card-header">
                                <h5 class="text-muted">
                                    Cart(0 product)
                                </h5>
                            </div>
                            <div class="card-body cart">
                                <div class="col-sm-12 empty-cart-cls text-center">
                                    <img src="https://cdn-icons-png.flaticon.com/512/262/262611.png" width="130" height="130"
                                         class="img-fluid mb-4 mr-3">
                                    <h3><strong>Your Cart is Empty</strong></h3>
                                    <h4>Add something to make me happy</h4>
                                    <a href="product-list" class="btn-back btn cart-btn-transform m-3 " data-abc="true">Continue
                                        Shopping</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>

        <jsp:include page="/components/footer.jsp"></jsp:include>
    </body>
</html>