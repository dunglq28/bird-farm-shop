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
                            <div class="col-sm-6">
                                <div class="thumbnail">
                                    <img src="https://cdn.pixabay.com/photo/2014/07/05/16/29/hatchlings-384896_1280.jpg"
                                         width="600" height="400">
                                    <p><strong>Available at shop</strong></p>
                                    <p>
                                    </p>
                                    <button class="btn">Order</button>
                                    <input type="hidden" name="btAction" value="OrderAvailableBirdNest">
                                </div>
                            </div>
                        </form>
                        <form action="Checkout" method="POST">
                            <div class="col-sm-6">
                                <div class="thumbnail">
                                    <img src="https://www.thesprucepets.com/thmb/X6Se5sWlNMb0pDUD4vh-jM65NXU=/2121x0/filters:no_upscale():strip_icc()/australian-finch--taeniopygia-guttata--807072894-79e2ba40ea54453fa9c64429d8d234e1.jpg"
                                         width="600" height="400">
                                    <p><strong>Based on the bird lists at shop</strong></p>
                                    <p>
                                    </p>
                                    <button class="btn">Book Now</button>
                                    <input type="hidden" name="txtServiceID" value="2" />
                                </div>
                            </div>
                        </form>
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
