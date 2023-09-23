<%-- 
    Document   : home
    Created on : Sep 17, 2023, 12:41:43 AM
    Author     : hj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bird Farm Shop</title>
        <script src="https://kit.fontawesome.com/46d5dcf0b7.js" crossorigin="anonymous"></script>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="./assets/css/public.css">
    </head>
    <!--    <body>


</body>-->
    <body>

        <header>
            <a href="#" class="brand">Bird Farm Shop</a>
            <div class="menu-btn"></div>
            <div class="navigation">
                <div class="navigation-items">
                    <div class="item">
                        <a href="#">Home</a>
                        <a href="#">Shop</a>
                        <a href="#">Contact</a>
                        <c:if test="${empty sessionScope.ACCOUNT}">
                            <a href="guest?btAction=loginPage">Login </a>
                            <div class="separator"></div>
                            <a href="guest?btAction=registerPage">Register </a> 
                        </c:if>
                    </div>
                    <c:if test="${not empty sessionScope.ACCOUNT}">
                        <div class="dropdown">
                            <button class="dropbtn"><i class="fa-regular fa-circle-user"></i>${sessionScope.ACCOUNT.fullName}</button>
                            <div class="dropdown-content-wrapper">
                                <div class="dropdown-content">
                                    <a href="#">My account</a>
                                    <a href="#">My purchase</a>
                                    <a href="guest?btAction=logout">Logout</a>
                                </div>
                            </div>
                        </div>
                    </c:if>

                </div>
            </div>
        </header>

        <div class="container">
            <div class="intro">
                <section class="home">

                    <video class="video-slide active" src="./assets/video/1.mp4" autoplay muted loop></video>
                    <video class="video-slide" src="./assets/video/2.mp4" autoplay muted loop></video>
                    <video class="video-slide" src="./assets/video/3.mp4" autoplay muted loop></video>
                    <video class="video-slide" src="./assets/video/4.mp4" autoplay muted loop></video>
                    <video class="video-slide" src="./assets/video/5.mp4" autoplay muted loop></video>

                    <div class="content active">
                        <h1>WELCOME TO<br><span>BIRD FARM SHOP</span></h1>
                        <p>
                            We believe in simplicity and integrity, ensuring a life that’s honest, down to earth and true to self. 
                            We are friendly, fun-loving and bursting with heaps of energy, spreading the joy with everyone we meet.
                            We enjoy spending quality time together while shopping online with friends and family - doing the things we love as one big unit.
                        </p>
                        <a href="#">Shop now</a>
                    </div>
                    <div class="content">
                        <h1>WELCOME TO<br><span>BIRD FARM SHOP</span></h1>
                        <p>
                            We believe in simplicity and integrity, ensuring a life that’s honest, down to earth and true to self. 
                            We are friendly, fun-loving and bursting with heaps of energy, spreading the joy with everyone we meet.
                            We enjoy spending quality time together while shopping online with friends and family - doing the things we love as one big unit.
                        </p>
                        <a href="#">Shop now</a>
                    </div>
                    <div class="content">
                        <h1>WELCOME TO<br><span>BIRD FARM SHOP</span></h1>
                        <p>
                            We believe in simplicity and integrity, ensuring a life that’s honest, down to earth and true to self. 
                            We are friendly, fun-loving and bursting with heaps of energy, spreading the joy with everyone we meet.
                            We enjoy spending quality time together while shopping online with friends and family - doing the things we love as one big unit.
                        </p>
                        <a href="#">Shop now</a>
                    </div>
                    <div class="content">
                        <h1>WELCOME TO<br><span>BIRD FARM SHOP</span></h1>
                        <p>
                            We believe in simplicity and integrity, ensuring a life that’s honest, down to earth and true to self. 
                            We are friendly, fun-loving and bursting with heaps of energy, spreading the joy with everyone we meet.
                            We enjoy spending quality time together while shopping online with friends and family - doing the things we love as one big unit.
                        </p>
                        <a href="#">Shop now</a>
                    </div>
                    <div class="content">
                        <h1>WELCOME TO<br><span>BIRD FARM SHOP</span></h1>
                        <p>
                            We believe in simplicity and integrity, ensuring a life that’s honest, down to earth and true to self. 
                            We are friendly, fun-loving and bursting with heaps of energy, spreading the joy with everyone we meet.
                            We enjoy spending quality time together while shopping online with friends and family - doing the things we love as one big unit.
                        </p>
                        <a href="#">Shop now</a>
                    </div>

                    <div class="slider-navigation">
                        <div class="nav-btn active"></div>
                        <div class="nav-btn"></div>
                        <div class="nav-btn"></div>
                        <div class="nav-btn"></div>
                        <div class="nav-btn"></div>
                    </div>
                </section>
                <script src="./assets/js/navigation.js"></script>
            </div>

            <div class="food">
                <div>
                    <h3>"Healthy environment - Healthy birds"</h3>
                </div>
                <div>
                    <P>“Bird Farm” is our step towards sustainable development. With the goal of building an environmentally 
                        friendly farm, our farm has a diverse ecological habitat: cool air with many trees, carefully selected 
                        and rich natural food sources for birds. Fiber and minerals for healthy birds.</P>
                </div>
            </div>

            <div class="service">
                <h2>SERVICE</h2>
                <div class="column">
                    <div class="card">
                        <img src="https://cdn.pixabay.com/photo/2018/04/22/15/58/animals-3341443_1280.jpg">
                        <a href=""><p>Selling bird</p></a>
                    </div>
                    <div class="card">
                        <img src="https://cdn.pixabay.com/photo/2018/05/02/09/36/bird-3368100_1280.jpg">
                        <a href=""><p>Odering bird's nest</p></a>
                    </div>

                </div>
            </div>

            <div class="featured">
                <h2>FEATURED PRODUCT</h2>

                <div class="column">
                    <div class="card">
                        <a href="">
                            <img src="https://cdn.download.ams.birds.cornell.edu/api/v1/asset/240817371/900">
                        </a>
                        <div class="sale">
                            <span>Giảm 30%</span>
                        </div>
                        <div class="card-content">
                            <h4>Grey parrot</h4>
                            <span class="bricked-price">$1900</span>
                            <span class="price">$1000</span></br></br>
                            <a href="">Detail</a>
                        </div>
                    </div>
                    <div class="card">
                        <a href="">
                            <div class="sale">
                                <span>Giảm 30%</span>
                            </div>
                            <img src="https://upload.wikimedia.org/wikipedia/commons/d/d3/Papagaio-galego.jpg">
                        </a>
                        <div class="card-content">
                            <h4>Yellow-faced parrot</h4>
                            <span class="bricked-price">$1900</span>
                            <span class="price">$1000</span></br></br>
                            <a href="">Detail</a>
                        </div>
                    </div>
                    <div class="card">
                        <a href="">
                            <img src="https://ambassadoranimalsag.files.wordpress.com/2020/11/peanut.jpg">
                        </a>
                        <div>
                            <div class="card-content">
                                <h4>Scarlet macaw</h4>
                                <span class="bricked-price">$1900</span>
                                <span class="price">$1000</span></br></br>
                                <a href="">Detail</a>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <a href="">
                            <img src="https://img.birdsnow.com/slir/w600/birds/data/photos/593435/1661754524/tumbler-pigeon-for-sale-in-hollywood-fl.jpg">
                        </a>
                        <div class="sale">
                            <span>Giảm 30%</span>
                        </div>
                        <div class="card-content">
                            <h4>Tumbler Pigeon</h4>
                            <span class="bricked-price">$1900</span>
                            <span class="price">$1000</span></br></br>
                            <a href="">Detail</a>
                        </div>
                    </div>
                </div>

                <div class="column">
                    <div class="card">
                        <a href="">
                            <img src="https://upload.wikimedia.org/wikipedia/commons/0/08/Zosterops_atricapilla.jpg">
                        </a>
                        <div class="sale">
                            <span>Giảm 30%</span>
                        </div>
                        <div class="card-content">
                            <h4>Zosterops atricapillla</h4>
                            <span class="bricked-price">$1900</span>
                            <span class="price">$1000</span></br></br>
                            <a href="">Detail</a>
                        </div>

                    </div>
                    <div class="card">
                        <a href="">
                            <img src="https://a-z-animals.com/media/2022/09/shutterstock_1709394988.jpg">
                        </a>
                        <div class="card-content">
                            <h4>Hyacinth macaw</h4>
                            <span class="bricked-price">$1900</span>
                            <span class="price">$1000</span></br></br>
                            <a href="">Detail</a>
                        </div>
                    </div>
                    <div class="card">
                        <a href="">
                            <img src="https://cdn.download.ams.birds.cornell.edu/api/v1/asset/303113441/1200">
                        </a>
                        <div class="sale">
                            <span>Giảm 30%</span>
                        </div>
                        <div class="card-content">
                            <h4>Senegal parrot</h4>
                            <span class="bricked-price">$1900</span>
                            <span class="price">$1000</span></br></br>
                            <a href="">Detail</a>
                        </div>
                    </div>
                    <div class="card">
                        <a href="">
                            <img src="https://img.birdsnow.com/slir/w600/birds/data/photos/625783/1680377299/dove-for-sale-in-savannah-mo.jpg">
                        </a>
                        <div class="sale">
                            <span>Giảm 30%</span>
                        </div>
                        <div class="card-content">
                            <h4>Diamond Dove</h4>
                            <span class="bricked-price">$1900</span>
                            <span class="price">$1000</span></br></br>
                            <a href="">Detail</a>
                        </div>
                    </div>
                </div>

            </div>


            <div class="love">
                <div>
                    <img src="https://cdn.pixabay.com/photo/2019/05/29/14/32/parrot-4237671_1280.jpg"/>
                </div>
                <div class="info">
                    <h3>We have energy and responsibility</h3>
                    <p>
                        Bird Farm Shop's mission is "Bird Farm is committed to bringing the healthiest and best
                        quality birds to the community with our respect, love and high responsibility to human 
                        life and society ".</p>
                </div>
            </div>


            <div class="footer">
                <div class="column">
                    <div class="card">
                        <h4>About us</h4>
                        <ul class="nav">
                            <li class="nav-item"><a href="https://www.facebook.com/birdfarmshop" class="nav-link pl-0"><i class="fa-solid fa-question fa-lg"></i>Why choose BirdFarmShop</a></li>
                            <li class="nav-item"><a href="" class="nav-link"><i class="fa-solid fa-people-group fa-lg"></i>Our team</a></li>
                            <li class="nav-item"><a href="" class="nav-link"><i class="fa-solid fa-briefcase fa-lg"></i>Work with us</a></li>
                        </ul>
                    </div>

                    <div class="card">
                        <h4>Contact us</h4>
                        <ul class="nav">
                            <li class="nav-item"><a href="https://www.facebook.com/birdfarmshop" class="nav-link pl-0"><i class="fa fa-facebook fa-lg"></i>Bird Farm Shop</a></li>
                            <li class="nav-item"><a href="" class="nav-link"><i class="fa-regular fa-envelope fa-lg"></i>thebird.farm.1704@gmail.com</a></li>
                            <li class="nav-item"><a href="" class="nav-link"><i class="fa-solid fa-phone fa-lg"></i>+84 83 234 5780</a></li>
                            <li><a href="" class="nav-link"><i class="fa-solid fa-location-dot fa-lg"></i>Cukuin, Daklak</a></li>
                        </ul>
                    </div>

                    <div class="card">
                        <ul class="nav">
                            <li class="nav-item"><a href="" class="nav-link pl-0"><i class="fa-solid fa-person fa-lg"></i>BECOME A MEMBER</a></li>
                            <li class="nav-item"><a href="" class="nav-link"><i class="fa-regular fa-paper-plane fa-lg"></i>SEND US FEEDBACK</a></li>
                    </div>
                </div>
                <p>Copyright &copy; 2023, BirdFarmShop.com.vn</p>

            </div>
    </body>
</html>
