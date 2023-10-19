<%-- 
    Document   : babyBirdTracking
    Created on : Oct 14, 2023, 10:41:18 AM
    Author     : tt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>My bird nest tracking</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="../../assets/css/homePage.css">
        <link rel="stylesheet" href="../../assets/css/babyBirdTracking.css">
    </head>
    <body>
        <jsp:include page="/components/header.jsp"></jsp:include>
            <div class="container px-1 px-md-4 py-5 mx-auto">
                <div class="birdchild-info">
                    <div class="row justify-content-center">
                        <div class="col-12">
                            <div class="table-responsive bg-white">
                                <table class="table mb-0">
                                    <thead>
                                        <tr>
                                            <th scope="col">BABY BIRD ID</th>
                                            <th scope="col">BABY BIRD NAME</th>
                                            <th scope="col">STATUS</th>
                                            <th scope="col">UPDATE TIME</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th scope="row" style="color: #666666;">BB-0221</th>
                                            <td>Congo African-Turquoise parrot</td>
                                            <td>Being incubated</td>
                                            <td>2023-10-13 23:59:59</td>
                                        </tr>
                                        <tr>
                                            <th scope="row" style="color: #666666;">BB-0222</th>
                                            <td>Congo African-Turquoise parrot</td>
                                            <td>Has hatched</td>
                                            <td>2023-10-13 23:59:59</td>
                                        </tr>
                                        <tr>
                                            <th scope="row" style="color: #666666;">BB-0223</th>
                                            <td>Congo African-Turquoise parrot</td>
                                            <td>Dead</td>
                                            <td>2023-10-13 23:59:59</td>
                                        </tr>

                                    </tbody>

                                </table>
                                <div class="center">
                                    <div class="pagination">
                                        <a href="#"><i class="fa fa-angle-double-left"></i></a>
                                        <a href="#"><i class="fa fa-angle-left"></i></a>
                                        <a href="#" class="active">1</a>
                                        <a href="#">2</a>
                                        <a href="#">3</a>
                                        <a href="#">4</a>
                                        <a href="#">5</a>
                                        <a href="#">6</a>
                                        <a href="#"><i class="fa fa-angle-right"></i></a>
                                        <a href="#"><i class="fa fa-angle-double-right"></i></a>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="birdparent-info" style="padding-top:20px">
                    <div class="row justify-content-center">
                        <div class="col-12">
                            <div class="table-responsive bg-white">
                                <table class="table mb-0">
                                    <thead>
                                        <tr>
                                            <th scope="col">PARENT BIRD ID</th>
                                            <th scope="col">PARENT BIRD NAME</th>
                                            <th scope="col">PARENT BIRD GENDER</th>
                                            <th scope="col">STATUS</th>
                                            <th scope="col">UPDATE TIME</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th scope="row" style="color: #666666;">PB-0221</th>
                                            <td>Congo African parrot</td>
                                            <td>Male</td>
                                            <td>........</td>
                                            <td>2023-10-13 23:59:59</td>
                                        </tr>
                                        <tr>
                                            <th scope="row" style="color: #666666;">PB-0222</th>
                                            <td>Turquoise parrot</td>
                                            <td>Female</td>
                                            <td>.........</td>
                                            <td>2023-10-13 23:59:59</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div class="center">
                                    <div class="pagination">
                                        <a href="#"><i class="fa fa-angle-double-left"></i></a>
                                        <a href="#"><i class="fa fa-angle-left"></i></a>
                                        <a href="#" class="active">1</a>
                                        <a href="#">2</a>
                                        <a href="#">3</a>
                                        <a href="#">4</a>
                                        <a href="#">5</a>
                                        <a href="#">6</a>
                                        <a href="#"><i class="fa fa-angle-right"></i></a>
                                        <a href="#"><i class="fa fa-angle-double-right"></i></a>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="time-line">
                    <div class="card">
                        <div class="row d-flex justify-content-between px-3 step">
                            <div class="d-flex flex-column text-sm-left">
                                <h5>ORDER ID: <span class="text-secondary font-weight-bold order">#O30</span></h5>
                                <h6>SERVICE: <span class="text-secondary  order">Pair birds of
                                        customers upon request</span></h6>
                                <h6>OPTION: <span class="text-secondary order">Get bird
                                        eggs</span></h6>
                                <h6>EGG QUANTITY: <span class="text-secondary order">3</span></h6>
                            </div>
                            <div class="d-flex flex-column text-sm-left">
                                <p class="mb-0">Update <span>2023-10-13</span></p>
                                <p style="margin-bottom: 0;">Staff <span class="font-weight-bold">Herry Tran</span></p>
                                <p>Customer <span class="font-weight-bold">Tran Manh Cuong</span></p>
                            </div>
                        </div>
                        <!-- Add class 'active' to progress -->
                        <div class="row d-flex justify-content-center">
                            <div class="col-12">
                                <ul id="progressbar" class="text-center">
                                    <li class="active step0"></li>
                                    <li class="active step0"></li>
                                    <li class="active step0"></li>
                                    <li class="step0"></li>
                                </ul>
                            </div>
                        </div>
                        <div class="row justify-content-between step-content">
                            <div class="row d-flex icon-content">
                                <div class="d-flex flex-column">
                                    <p class="font-weight-bold">Processing</p>
                                </div>
                            </div>
                            <div class="row d-flex icon-content">
                                <div class="d-flex flex-column">
                                    <p class="font-weight-bold">Mating</p>
                                </div>
                            </div>
                            <div class="row d-flex icon-content">
                                <div class="d-flex flex-column">
                                    <p class="font-weight-bold">Tracking<br>Egg</p>
                                </div>
                            </div>
                            <div class="row d-flex icon-content">
                                <div class="d-flex flex-column">
                                    <p class="font-weight-bold">Preparing<br>For Delivery</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <jsp:include page="/components/footer.jsp"></jsp:include>
    </body>
</html>
