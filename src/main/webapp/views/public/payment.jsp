<%-- 
    Document   : payment
    Created on : Oct 2, 2023, 5:54:04 PM
    Author     : hoang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment</title>
    <link rel="stylesheet" href="./assets/css/">
    <link rel="stylesheet" href="./assets/css/homePage.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <script src="/assets/js/payment.js"></script>
</head>

<body>
    <!-- header -->
<jsp:include page="/components/header.jsp"></jsp:include>
    <!-- header -->


    <form class="container py-5 h-100 ">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-12">
                <div class="card card-registration card-registration-2" style="border-radius: 15px;">
                    <div class="card-body p-0">
                        <div class="row g-0">
                            <div class="col-lg-8">
                                <div class="p-5">
                                    <div>
                                        <div class="d-flex justify-content-between align-items-center mb-3">
                                            <h4 class="fw-bold mb-0 text-black">Information receive</h4>
                                            <a href="#" class="change-infor-link text-decoration-none">
                                                <h6 class="mb-0 text-muted ">Change information</h6>
                                            </a>
                                        </div>
                                        <div class="d-flex justify-content-between align-items-center mb-1">

                                            <h6 class="mb-0 text-muted ">Hoang Trung Luu - 0933286349</h6>
                                        </div>
                                        <div class="d-flex justify-content-between align-items-center">

                                            <h6 class="mb-0 text-muted ">Lô E2a-7, Đường D1, Đ. D1, Long Thạnh Mỹ,
                                                Thành Phố Thủ Đức, Thành phố Hồ Chí Minh 700000</h6>
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
                                                <input class="form-check-input-2" type="radio" name="shippingMethod" id="exampleRadios1" value="option1" checked>
                                                <label class="form-check-label" for="exampleRadios1">
                                                    Payment on delivery (Cash)
                                                </label>
                                            </div>
                                            <div class="form-check fisrt-element">
                                                <input class="form-check-input-1" type="radio" name="shippingMethod" id="exampleRadios2" value="option2">
                                                <label class="form-check-label" for="exampleRadios2">
                                                    Receive directly at shop
                                                </label>
                                                <div class="form-control justify-content-center"
                                                    style="max-width: 300px;display: none; "
                                                    id="datePickerDiv">
                                                    <h6 class="" style="width: 100%;margin-left: 44px;">Enter the desired time</h6>
                                                    <div class="d-flex">
                                                        <div class="form-input-day">
                                                            <select name="txtDay" class="select-control text-muted">
                                                                <option label="Day"></option>
                                                                <option value="1">1</option>
                                                            </select>
                                                        </div>
                                                        <div class="form-input-day">
                                                            <select name="txtMonth" class="select-control text-muted">
                                                                <option label="Month"></option>
                                                                <option value="1">1</option>
                                                            </select>
                                                        </div>
                                                        <div class="form-input-day">
                                                            <select name="txtYear" class="select-control text-muted">
                                                                <option label="Year"></option>
                                                                <option value="2008">2008</option>
                                                            </select>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>

                                   
                                    
                                    <hr class="my-4">
                                    <div>
                                        <div class="d-flex justify-content-between align-items-center mb-3">
                                            <h4 class="fw-bold mb-0 text-black">Payment method </h4>
                                        </div>

                                        <div class="row mb-4 d-flex justify-content-between align-items-center">

                                            <div class="element-1  form-check">
                                                <input class="form-check-input-2" type="radio" name="exampleRadios"
                                                    id="exampleRadios1" value="option1">
                                                <label class="form-check-label" for="exampleRadios1">
                                                    Payment on delivery (Cash)
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input-2" type="radio" name="exampleRadios"
                                                    id="exampleRadios2" value="option2">
                                                <label class="form-check-label" for="exampleRadios2">
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
                                        <h4 class="fw-bold mb-0 text-black">Update</h4>
                                        <a href="#" class="change-infor-link text-decoration-none">
                                            <h6 class="mb-0 text-muted ">Change</h6>
                                        </a>
                                    </div>
                                    <hr class="my-4">
                                    <div class="row mb-12 d-flex justify-content-between align-items-center">
                                        <div class="col-md-4">
                                            <img src="https://img.birdsnow.com/slir/w600/birds/data/photos/636763/1694634846/bird-for-sale-in-stanton-ca.jpg"
                                                class="img-fluid rounded-3" alt="Bird Image">
                                        </div>
                                        <div class="col-md-8 justify-content-center">
                                            <h5 class="text-black mb-0">Toco Toucan</h5>
                                            <div class="d-flex justify-content-between align-items-center mb-3">
                                                <h6 class="mb-0 text-muted ">SL:1</h6>
                                                <a href="#" class="change-infor-link text-decoration-none">
                                                    <h6 class="mb-0 text-muted ">x10,000</h6>
                                                </a>
                                            </div>
                                        </div>
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
                                    <div class="mb-4">


                                        <div class="Promotion-received-element">
                                            <h6>Voucher: Discount 10%</h6>
                                        </div>

                                    </div>


                                    <hr class="my-4">
                                    <div class="d-flex justify-content-between mb-1">
                                        <h6 class="text-uppercase">Temporary</h6>
                                        <h6>$ 0</h6>
                                    </div>

                                    <div class="d-flex justify-content-between mb-1">
                                        <h6 class="text-uppercase">Tranport Fee</h6>
                                        <h6>$ 10,000</h6>
                                    </div>
                                    <div class="d-flex justify-content-between mb-3">
                                        <h6 class="text-uppercase">discount</h6>
                                        <h6>$ 1,000</h6>
                                    </div>
                                    <div class="d-flex justify-content-between mb-2">
                                        <h5 class="text-uppercase">Total price</h5>
                                        <h5>$ 9,000</h5>
                                    </div>

                                    <input type="submit" class="btn btn-dark btn-block btn-lg"
                                        data-mdb-ripple-color="dark" value="Order"
                                        style="background-color:rgb(13,103,128) ;">
                                    </input>

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
</body>

</html>
