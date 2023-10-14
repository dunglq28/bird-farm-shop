<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Bird Nest Service</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css">
        <link rel="stylesheet" href="./assets/css/homePage.css">
        <link rel="stylesheet" href="./assets/css/birdNest.css">
    </head>
    <body>
        <jsp:include page="/components/header.jsp"></jsp:include>
            <div class="content">
                <!-- quotes -->
                <div class="quotes text-center">
                    <h3>OUR MISSION</h3>
                    <p class="">" Each of our happy and healthy birds has embryos selected to be born and cared for extremely
                        carefully,
                        with clear origins and certified documents. Order a bird now, our birds will be an exciting part of
                        your
                        life - we guarantee it! "</p>
                    <p class="">
                        1. All orders must be prepaid 50% to follow the status of the bird nests.<br>
                        2. If a customer want shop to combine customer birds with shop birds. Customers must bring customer birds after finishing orders. Shop will not keep those birds.<br>
                        3. Shop cannot sure all eggs in a bird nest could be hatch if there are some eggs in birds nest cannot be hatch shop will not take responsibilities.<br>
                        4.Bird nest price will base on the numbers of eggs and the rarity of eggs plus applicable sales tax, delivery charge if shop delivers it to customer.<br>
                        5. All birds or eggs in a single order must be paid for by using the same payment method.<br>
                    </p>
                </div>

            </div>

            <!-- Service option -->
            <div class="service-option">
                <div class="container">
                    <h3 class="text-center">ORDER BIRD NEST SERVICES</h3>
                    <p class="text-center">Please choose one option that suits you now!
                        <br>Cute birds are waiting for you!
                    </p>
                    <ul class="list-group">
                    </ul>

                    <div class="row text-center">
                        <form action="Bird-Nest-Services" method="POST">
                            <div class="col-sm-4">
                                <div class="thumbnail">
                                    <img src="https://cdn.pixabay.com/photo/2018/05/24/02/07/bird-eggs-3425657_1280.jpg"
                                         width="400" height="400">
                                    <p><strong>Available at shop</strong></p>
                                    <p>
                                    </p>
                                    <button class="btn">Order</button>
                                    <input type="hidden" name="btAction" value="OrderAvailableBirdNest">
                                </div>
                            </div>
                        </form>

                        <div class="col-sm-4">
                            <div class="thumbnail">
                                <img src="https://www.thesprucepets.com/thmb/X6Se5sWlNMb0pDUD4vh-jM65NXU=/2121x0/filters:no_upscale():strip_icc()/australian-finch--taeniopygia-guttata--807072894-79e2ba40ea54453fa9c64429d8d234e1.jpg"
                                     width="400" height="400">
                                <p><strong>Based on the bird lists at shop</strong></p>
                                <p>
                                </p>
                                <button class="btn" data-toggle="modal" data-target="#myModal2">Order</button>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="thumbnail">
                                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQEaIl1E9gv1vDDHVs_DsFy93aXSJxGmu-phrzzwecCC0FySyV36kA2MVAhRi82-INQh8&usqp=CAU"
                                     width="400" height="400">
                                <p><strong>Based on customer's birds</strong></p>
                                <p></p>
                                <button class="btn" data-toggle="modal" data-target="#myModal">Order</button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Based on customer bird -->
                <div class="modal fade" id="myModal" role="dialog">
                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">×</button>
                                <h4>Bird Nest Service Form</h4>
                            </div>


                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-12 mx-0">
                                        <form id="msform">
                                            <!-- progressbar -->
                                            <ul id="progressbar">
                                                <li class="active" id="account"><strong>Private and Policy</strong></li>
                                                <li id="payment"><strong>Bird information</strong></li>
                                                <li id="personal"><strong>Customer information</strong></li>
                                                <li id="confirm"><strong>Finish</strong></li>
                                            </ul>
                                            <!-- fieldsets -->
                                            <fieldset>
                                                <div class="form-card">
                                                    <h2 class="fs-title">Private and Policy</h2>
                                                    <h6>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Esse
                                                        numquam atque obcaecati! Consequatur, quia iste similique odio
                                                        beatae quis veritatis a, nobis commodi maxime amet fugit, esse
                                                        id
                                                        laudantium nemo! Lorem ipsum, dolor sit amet consectetur
                                                        adipisicing
                                                        elit. Expedita repellat animi cumque similique ad harum, esse
                                                        odio
                                                        veniam. Id, animi neque aspernatur est vitae magnam sequi
                                                        incidunt
                                                        esse nemo corrupti.</h6>
                                                </div>
                                                <input type="button" name="next" class="next action-button" value="Next Step" />
                                            </fieldset>
                                            <fieldset>
                                                <div class="form-card">
                                                    <h2 class="fs-title">Bird Information</h2>
                                                    <div class="row">
                                                        <div class="col-3">
                                                            <label class="pay">Your bird*</label>
                                                        </div>
                                                        <div class="col-9">
                                                            <select class="list-dt">
                                                                <option selected>Species</option>
                                                                <option>Parrot</option>
                                                                <option>Dove</option>
                                                                <option>Owl</option>
                                                                <option>Eagle</option>
                                                                <option>Crow</option>
                                                                <option>Others</option>
                                                            </select>
                                                            <select class="list-dt">
                                                                <option selected>Sex</option>
                                                                <option>Male</option>
                                                                <option>Female</option>
                                                                <option>Unknown</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="row" style="margin-top:10px">
                                                        <div class="col-3">
                                                            <label class="pay">The bird that you want to be
                                                                matched*</label>
                                                        </div>
                                                        <div class="col-9">
                                                            <select class="list-dt">
                                                                <option selected>Name of the bird</option>
                                                                <option>Green parrot</option>
                                                                <option>Australia dove</option>
                                                                <option>White Owl</option>
                                                                <option>Big red eagle</option>
                                                                <option>Dark Crow</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="row" style="margin-top:10px">
                                                        <div class="col-3">
                                                            <label class="pay">Appointment date*</label>
                                                        </div>
                                                        <div class="col-9">
                                                            <select class="list-dt">
                                                                <option selected>Month</option>
                                                                <option>January</option>
                                                                <option>February</option>
                                                                <option>March</option>
                                                                <option>April</option>
                                                                <option>May</option>
                                                                <option>June</option>
                                                                <option>July</option>
                                                                <option>August</option>
                                                                <option>September</option>
                                                                <option>October</option>
                                                                <option>November</option>
                                                                <option>December</option>
                                                            </select>
                                                            <select class="list-dt">
                                                                <option selected>Day</option>
                                                                <option>Monday</option>
                                                                <option>Tuesday</option>
                                                                <option>Wedday</option>
                                                                <option>Thursday</option>
                                                                <option>Friday</option>
                                                                <option>Saturday</option>
                                                                <option>Sunday</option>
                                                            </select>
                                                        </div>

                                                    </div>
                                                </div>
                                                <input type="button" name="previous" class="previous action-button-previous"
                                                       value="Previous" />
                                                <input type="button" name="next" class="next action-button" value="Next Step" />
                                            </fieldset>

                                            <fieldset>
                                                <div class="form-card">
                                                    <h2 class="fs-title">Customer Information</h2>
                                                    <input type="text" name="address" placeholder="Address" />
                                                    <input type="text" name="phone" placeholder="Phone number" />
                                                    <input type="text" name="mail" placeholder="Email" />
                                                </div>

                                                <input type="button" name="previous" class="previous action-button-previous"
                                                       value="Previous" />
                                                <input type="button" name="make_payment" class="next action-button"
                                                       value="Confirm" />
                                            </fieldset>

                                            <fieldset>
                                                <div class="form-card">
                                                    <h2 class="fs-title text-center">Success ! </h2>
                                                    <br><br>
                                                    <div class="row justify-content-center">
                                                        <div class="col-3">
                                                            <img src="https://tips.typeapp.com/assets/ic_action_done.png"
                                                                 class="fit-image"
                                                                 style="width:100%; height:300px; object-fit: contain;">

                                                        </div>
                                                    </div>
                                                    <br><br>
                                                    <div class="row justify-content-center">
                                                        <div class="col-7 text-center">
                                                            <h5>You Have Successfully Submit</h5>
                                                        </div>
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </form>
                                    </div>
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Based on the bird lists at shop -->
                <div class="modal fade" id="myModal2" role="dialog">
                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">×</button>
                                <h4>Bird Nest Service Form</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-12 mx-0">
                                        <form id="msform">
                                            <!-- progressbar -->
                                            <ul id="progressbar">
                                                <li class="active" id="account"><strong>Private and Policy</strong></li>
                                                <li id="payment"><strong>Bird information</strong></li>
                                                <li id="confirm"><strong>Finish</strong></li>
                                            </ul>
                                            <!-- fieldsets -->
                                            <fieldset>
                                                <div class="form-card">
                                                    <h2 class="fs-title">Private and Policy</h2>
                                                    <h6>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Esse
                                                        numquam atque obcaecati! Consequatur, quia iste similique odio
                                                        beatae quis veritatis a, nobis commodi maxime amet fugit, esse
                                                        id
                                                        laudantium nemo! Lorem ipsum, dolor sit amet consectetur
                                                        adipisicing
                                                        elit. Expedita repellat animi cumque similique ad harum, esse
                                                        odio
                                                        veniam. Id, animi neque aspernatur est vitae magnam sequi
                                                        incidunt
                                                        esse nemo corrupti.</h6>
                                                </div>
                                                <input type="button" name="next" class="next action-button" value="Next Step" />
                                            </fieldset>
                                            <fieldset>
                                                <div class="form-card">
                                                    <h2 class="fs-title">Bird Information</h2>
                                                    <div class="row">
                                                        <div class="col-3">
                                                            <label class="pay">Species*</label>
                                                        </div>
                                                        <div class="col-9">
                                                            <select class="list-dt">
                                                                <option selected>Species</option>
                                                                <option>Parrot</option>
                                                                <option>Dove</option>
                                                                <option>Owl</option>
                                                                <option>Eagle</option>
                                                                <option>Crow</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="row" style="margin-top:10px">
                                                        <div class="col-3">
                                                            <label class="pay">Name of birds*</label>
                                                        </div>
                                                        <div class="col-9">
                                                            <select class="list-dt">
                                                                <option selected>Male</option>
                                                                <option>Parrot</option>
                                                                <option>Dove</option>
                                                                <option>Owl</option>
                                                                <option>Eagle</option>
                                                                <option>Crow</option>
                                                            </select>
                                                            <img style="width: 10%; height: 50px; padding: auto;"
                                                                 src="https://cdn.pixabay.com/photo/2014/07/08/12/36/bird-386725_1280.jpg" />
                                                            <select class="list-dt">
                                                                <option selected>Female</option>
                                                                <option>Parrot</option>
                                                                <option>Dove</option>
                                                                <option>Owl</option>
                                                                <option>Eagle</option>
                                                                <option>Crow</option>
                                                            </select>
                                                            <img style="width: 10%; height: 50px; padding: auto;"
                                                                 src="https://cdn.pixabay.com/photo/2014/07/08/12/36/bird-386725_1280.jpg" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <input type="button" name="previous" class="previous action-button-previous"
                                                       value="Previous" />
                                                <input type="button" name="make_payment" class="next action-button"
                                                       value="Confirm" />
                                            </fieldset>
                                            <fieldset>
                                                <div class="form-card">
                                                    <h2 class="fs-title text-center">Success ! </h2>
                                                    <br><br>
                                                    <div class="row justify-content-center">
                                                        <div class="col-3">
                                                            <img src="https://tips.typeapp.com/assets/ic_action_done.png"
                                                                 class="fit-image"
                                                                 style="width:100%; height:300px; object-fit: contain;">

                                                        </div>
                                                    </div>
                                                    <br><br>
                                                    <div class="row justify-content-center">
                                                        <div class="col-7 text-center">
                                                            <h5>You Have Successfully Submit</h5>
                                                        </div>
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </form>
                                    </div>
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <jsp:include page="/components/footer.jsp"></jsp:include>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script src="./assets/js/birdNest.js"></script>
    </body>
</html>
