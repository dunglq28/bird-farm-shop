
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
        <link rel="stylesheet" href="./assets/css/homePage.css">
        <link rel="stylesheet" href="./assets/css/babyBirdTracking.css">
    </head>
    <body>
        <jsp:include page="/components/header.jsp"></jsp:include>
        <jsp:useBean id="util" class="Utils.FormatCurrency"></jsp:useBean>
            <div class="container px-1 px-md-4 py-5 mx-auto">
                <div class="birdparent-info" style="padding-top:20px">
                    <div class="row justify-content-center">
                        <div class="col-12">
                            <div class="table-responsive bg-white">
                                <table class="table mb-0">
                                    <thead>
                                        <tr>
                                            <th scope="col">BIRD TYPE</th>
                                            <th scope="col">GENDER</th>
                                            <th scope="col">STATUS</th>
                                            <th scope="col">NOTE</th>
                                            <th scope="col">UPDATE TIME</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Male</td>
                                            <td>...type.....</td>
                                            <td>....status....</td>
                                            <td>The total invoice amount will be multiplied by the number of months the
                                                bird breeding service is used, with a cost of 4 million VND for each month
                                                (if a customer cancels the bird breeding service during the month of
                                                service, the shop will still charge for one month, which is 4 million VND).</td>
                                            <td>2023-10-13 23:59:59</td>
                                        </tr>
                                        <tr>
                                            <td>Female</td>
                                            <td>...type.....</td>
                                            <td>....status....</td>
                                            <td>....note....</td>
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
            <c:set var="bird_nest_tracking" value="${sessionScope.BIRD_NEST_TRACKING}"></c:set>
                <div class="time-line">
                    <div class="card">
                        <div class="row d-flex justify-content-between px-3 step">
                            <div class="d-flex flex-column text-sm-left">
                                <h5>ORDER ID: <span class="text-secondary font-weight-bold order">#${bird_nest_tracking.orderID}</span></h5>
                            <h6>SERVICE: <span class="text-secondary  order">Pair birds of customers upon request</span></h6>
                            <h6>OPTION: <span class="text-secondary order">${bird_nest_tracking.subService}</span></h6>
                            <h6>EGG QUANTITY: <span class="text-secondary order">${bird_nest_tracking.eggs_Quantity}</span></h6>
                        </div>
                        <div class="d-flex flex-column text-sm-left">
                            <p class="mb-0">Update <span>${util.FormatDate(bird_nest_tracking.lastUpdateDate)}</span></p>
                            <p style="margin-bottom: 0;">Staff <span class="font-weight-bold">Herry Tran</span></p>
                            <p>Customer <span class="font-weight-bold">${sessionScope.CUSTOMER.fullName}</span></p>
                        </div>
                    </div>
                    <!-- Add class 'active' to progress -->
                    <div class="row d-flex justify-content-center">
                        <div class="col-12">
                            <ul id="progressbar" class="text-center">
                                <li class="${bird_nest_tracking.status != 'Wait for confirmation' ? 'active' : ''} step0"></li>
                                <li class="${bird_nest_tracking.status != 'Processing' && 
                                             bird_nest_tracking.status != 'Wait for confirmation' ? 'active' : ''} step0">
                                </li>
                                <li class="${bird_nest_tracking.status != 'Wait for confirmation' &&
                                             bird_nest_tracking.status != 'Processing' &&
                                             bird_nest_tracking.status != 'Mating' ? 'active' : ''} step0">
                                </li>
                                <li class="${bird_nest_tracking.status != 'Wait for confirmation' &&
                                             bird_nest_tracking.status != 'Processing' &&
                                             bird_nest_tracking.status != 'Mating' &&
                                             bird_nest_tracking.status != 'Tracking Egg' ? 'active' : ''} step0">
                                </li>
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
