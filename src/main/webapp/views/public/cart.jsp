
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
                                                <h6 class="mb-0 text-muted">3 product</h6>
                                            </div>

                                            <div class=" mb-4 d-flex justify-content-between align-items-center">
                                                <h6 class="fw-bold col-md-6 col-lg-6 col-xl-6 text-muted">Product</h1>
                                                    <h6 class="fw-bold col-md-3 col-lg-3 col-xl-2 d-flex text-muted">Quantity
                                                    </h6>
                                                    <h6 class="fw-bold col-md-3 col-lg-2 col-xl-2 offset-lg-1 text-muted">Price
                                                    </h6>
                                                    <h6 class="col-md-1 col-lg-1 col-xl-1 text-end"></h6>
                                            </div>

                                            <hr class="my-4">
                                            <div class="product-element">
                                                <div class="row mb-4 d-flex justify-content-between align-items-center">

                                                    <div class="col-md-2 col-lg-2 col-xl-2">
                                                        <img src="https://cdn.download.ams.birds.cornell.edu/api/v1/asset/240817371/900"
                                                             class="img-fluid rounded-3" alt="Cotton T-shirt">
                                                    </div>
                                                    <div class="col-md-3 col-lg-3 col-xl-3">
                                                        <h6 class="text-muted">Bird</h6>
                                                        <h6 class="text-black mb-0">Grey parrot</h6>

                                                    </div>
                                                    <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                                                        <button class="btn btn-link px-2"
                                                                onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                                            <i class="fas fa-minus"></i>
                                                        </button>

                                                        <input id="form1" min="0" name="quantity" value="1" type="number"
                                                               class="form-control form-control-sm" />

                                                        <button class="btn btn-link px-2"
                                                                onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                                            <i class="fas fa-plus"></i>
                                                        </button>
                                                    </div>
                                                    <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                                        <h6 class="mb-0">$ 10,000</h6>
                                                    </div>
                                                    <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                                        <a href="#!" class="text-muted"><i class="fas fa-times"></i></a>
                                                    </div>
                                                </div>

                                                <div class="row mb-4 d-flex justify-content-between align-items-center">

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

                                                </div>
                                            </div>


                                            <hr class="my-4">
                                            <div class="product-element">
                                                <div class="row mb-4 d-flex justify-content-between align-items-center">
                                                    <div class="col-md-2 col-lg-2 col-xl-2">
                                                        <img src="https://cdn.download.ams.birds.cornell.edu/api/v1/asset/123337181/900"
                                                             class="img-fluid rounded-3" alt="Cotton T-shirt">
                                                    </div>
                                                    <div class="col-md-3 col-lg-3 col-xl-3">
                                                        <h6 class="text-muted">Bird</h6>
                                                        <h6 class="text-black mb-0">Turquoise parrot</h6>
                                                    </div>
                                                    <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                                                        <button class="btn btn-link px-2"
                                                                onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                                            <i class="fas fa-minus"></i>
                                                        </button>

                                                        <input id="form1" min="0" name="quantity" value="1" type="number"
                                                               class="form-control form-control-sm" />

                                                        <button class="btn btn-link px-2"
                                                                onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                                            <i class="fas fa-plus"></i>
                                                        </button>
                                                    </div>
                                                    <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                                        <h6 class="mb-0">$ 25,000</h6>
                                                    </div>
                                                    <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                                        <a href="#!" class="text-muted"><i class="fas fa-times"></i></a>
                                                    </div>
                                                </div>
                                                <!-- <div class="form-check">
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
                                                            id="exampleRadios3" value="option3" >
                                                        <label class="form-check-label" for="exampleRadios3">
                                                            Gift: free bird care voucher
                                                        </label>
                                                    </div> -->
                                            </div>


                                            <hr class="my-4">
                                            <div class="product-element">
                                                <div class="row mb-4 d-flex justify-content-between align-items-center">
                                                    <div class="col-md-2 col-lg-2 col-xl-2">
                                                        <img src="https://cdn.download.ams.birds.cornell.edu/api/v1/asset/56895731/1800"
                                                             class="img-fluid rounded-3" alt="Cotton T-shirt">
                                                    </div>
                                                    <div class="col-md-3 col-lg-3 col-xl-3">
                                                        <h6 class="text-muted">Bird</h6>
                                                        <h6 class="text-black mb-0">Chestnut-fronted macaw</h6>
                                                    </div>
                                                    <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                                                        <button class="btn btn-link px-2"
                                                                onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                                            <i class="fas fa-minus"></i>
                                                        </button>

                                                        <input id="form1" min="0" name="quantity" value="1" type="number"
                                                               class="form-control form-control-sm" />

                                                        <button class="btn btn-link px-2"
                                                                onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                                            <i class="fas fa-plus"></i>
                                                        </button>
                                                    </div>
                                                    <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                                        <h6 class="mb-0">$ 24,000</h6>
                                                    </div>
                                                    <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                                        <a href="#!" class="text-muted"><i class="fas fa-times"></i></a>
                                                    </div>
                                                </div>

                                                <div class="row mb-4 d-flex justify-content-between align-items-center">
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
                                                </div>
                                            </div>

                                            <hr class="my-4">
                                            <div class="product-element">
                                                <div class="row mb-4 d-flex justify-content-between align-items-center">
                                                    <div class="col-md-2 col-lg-2 col-xl-2">
                                                        <img src="https://img.birdsnow.com/slir/w600/birds/data/photos/636043/1693703197/talking-crimson-bellied-conure-for-sale.jpg"
                                                             class="img-fluid rounded-3" alt="Cotton T-shirt">
                                                    </div>
                                                    <div class="col-md-3 col-lg-3 col-xl-3">
                                                        <h6 class="text-muted">Bird</h6>
                                                        <h6 class="text-black mb-0">Crimson Bellied Conure</h6>
                                                    </div>
                                                    <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                                                        <button class="btn btn-link px-2"
                                                                onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                                            <i class="fas fa-minus"></i>
                                                        </button>

                                                        <input id="form1" min="0" name="quantity" value="1" type="number"
                                                               class="form-control form-control-sm" />

                                                        <button class="btn btn-link px-2"
                                                                onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                                            <i class="fas fa-plus"></i>
                                                        </button>
                                                    </div>
                                                    <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                                        <h6 class="mb-0">$ 24,000</h6>
                                                    </div>
                                                    <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                                        <a href="#!" class="text-muted"><i class="fas fa-times"></i></a>
                                                    </div>
                                                </div>

                                                <!-- <div class="row mb-4 d-flex justify-content-between align-items-center">
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
                                                            id="exampleRadios3" value="option3" >
                                                        <label class="form-check-label" for="exampleRadios3">
                                                            Gift: free bird care voucher
                                                        </label>
                                                    </div>
                                                </div> -->
                                            </div>

                                            <hr class="my-4">
                                            <div class="product-element">
                                                <div class="row mb-4 d-flex justify-content-between align-items-center">

                                                    <div class="col-md-2 col-lg-2 col-xl-2">
                                                        <img src="https://cdn.download.ams.birds.cornell.edu/api/v1/asset/240817371/900"
                                                             class="img-fluid rounded-3" alt="Cotton T-shirt">
                                                    </div>
                                                    <div class="col-md-3 col-lg-3 col-xl-3">
                                                        <h6 class="text-muted">Bird</h6>
                                                        <h6 class="text-black mb-0">Zebra Finch</h6>

                                                    </div>
                                                    <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                                                        <button class="btn btn-link px-2"
                                                                onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                                            <i class="fas fa-minus"></i>
                                                        </button>

                                                        <input id="form1" min="0" name="quantity" value="1" type="number"
                                                               class="form-control form-control-sm" />

                                                        <button class="btn btn-link px-2"
                                                                onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                                            <i class="fas fa-plus"></i>
                                                        </button>
                                                    </div>
                                                    <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                                        <h6 class="mb-0">$ 10,000</h6>
                                                    </div>
                                                    <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                                        <a href="#!" class="text-muted"><i class="fas fa-times"></i></a>
                                                    </div>
                                                </div>

                                                <div class="row mb-4 d-flex justify-content-between align-items-center">

                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" value=""
                                                               id="defaultCheck1" checked>
                                                        <label class="form-check-label" for="defaultCheck1">
                                                            Gift: free bird care voucher
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>


                                            <hr class="my-4">

                                            <div class="pt-5">
                                                <h6 class="mb-0"><a href="home" class="text-body"><i
                                                            class="fas fa-long-arrow-alt-left me-2"></i>Back to shop</a>
                                                </h6>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 bg-grey">
                                        <div class="p-5">
                                            <h3 class="fw-bold mb-5 mt-2 pt-1">Summary</h3>
                                            <hr class="my-4">

                                            <div class="d-flex justify-content-between mb-4">
                                                <h5 class="text-uppercase">Total</h5>
                                                <h5>$ 59,000</h5>
                                            </div>

                                            <div class="d-flex justify-content-between mb-4">
                                                <h5 class="text-uppercase">Discount</h5>
                                                <h5>$ 0</h5>
                                            </div>
                                            <!-- <h5 class="text-uppercase mb-3">Shipping</h5> -->

                                            <!-- <div class="mb-4 pb-2">
                                                        <select class="select">
                                                            <option value="1">Standard-Delivery- €5.00</option>
                                                            <option value="2">Two</option>
                                                            <option value="3">Three</option>
                                                            <option value="4">Four</option>
                                                        </select>
                                                    </div> -->

                                            <h5 class="text-uppercase mb-3">Promotion received</h5>

                                            <div class="mb-5">
                                                <!-- <div class="form-outline">
                                                            <input type="text" id="form3Examplea2"
                                                                class="form-control form-control-lg" />
                                                            <label class="form-label" for="form3Examplea2">Enter your
                                                                code</label>
                                                        </div> -->
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


                                            </div>

                                            <hr class="my-4">

                                            <div class="d-flex justify-content-between mb-5">
                                                <h5 class="text-uppercase">Total price</h5>
                                                <h5>$ 59,000</h5>
                                            </div>

                                            <button type="button" class="btn btn-dark btn-block btn-lg"
                                                    data-mdb-ripple-color="dark">
                                                Buy now
                                            </button>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <jsp:include page="/components/footer.jsp"></jsp:include>
    </body>
</html>
