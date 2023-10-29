<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Ashion Template">
        <meta name="keywords" content="Ashion, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Bird farm shop</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
              rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <!-- Css Styles -->
        <link rel="stylesheet" href="./assets/css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="./assets/css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="./assets/css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="./assets/css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="./assets/css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="./assets/css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="./assets/css/shopping.css">
        <link rel="stylesheet" href="./assets/css/homePage.css">

    </head>

    <body>
        <!-- header -->
        <jsp:include page="/components/header.jsp"></jsp:include>
            <!-- header    -->
        <jsp:useBean id="util" class="Utils.FormatCurrency"></jsp:useBean>


            <!-- Breadcrumb Begin -->
            <div class="breadcrumb-option">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="breadcrumb__links">
                                <a href="home"><i class="fa fa-home"></i> Home</a>
                                <span>Shop</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Breadcrumb End -->
            <!-- Shop Section Begin -->
            <section class="shop spad">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3 col-md-3">
                            <div class="shop__sidebar">
                                <div class="sidebar__categories">
                                    <div class="section-title">
                                        <h4>Categories</h4>
                                    </div>
                                    <div class="categories__accordion">
                                        <div class="accordion" id="accordionExample">
                                            <div class="card">
                                                <div class="card-heading active">
                                                    <a data-toggle="collapse" data-target="#collapseOne">Male</a>
                                                </div>
                                                <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
                                                    <div class="card-body">
                                                        <ul>
                                                            <li><a href="#">Parrot</a></li>
                                                            <li><a href="#">Macaw</a></li>
                                                            <li><a href="#">Pigeon</a></li>
                                                            <li><a href="#">Jenday Conure</a></li>
                                                            <li><a href="#">Parakeet</a></li>
                                                            <li><a href="#">Conure</a></li>
                                                            <li><a href="#">Cockatiel</a></li>
                                                            <li><a href="#">Eclectus</a></li>
                                                            <li><a href="#">Finch</a></li>
                                                            <li><a href="#">Cockatoo</a></li>
                                                            <li><a href="#">Canary</a></li>
                                                            <li><a href="#">Toucan</a></li>
                                                            <li><a href="#">Caique</a></li>
                                                            <li><a href="#">Duck</a></li>
                                                            <li><a href="#">Amazon Parrot</a></li>
                                                            <li><a href="#">Goose</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card">
                                                <div class="card-heading">
                                                    <a data-toggle="collapse" data-target="#collapseTwo">Female</a>
                                                </div>
                                                <div id="collapseTwo" class="collapse" data-parent="#accordionExample">
                                                    <div class="card-body">
                                                        <ul>
                                                            <li><a href="#">Parrot</a></li>
                                                            <li><a href="#">Macaw</a></li>
                                                            <li><a href="#">Pigeon</a></li>
                                                            <li><a href="#">Jenday Conure</a></li>
                                                            <li><a href="#">Parakeet</a></li>
                                                            <li><a href="#">Conure</a></li>
                                                            <li><a href="#">Cockatiel</a></li>
                                                            <li><a href="#">Eclectus</a></li>
                                                            <li><a href="#">Finch</a></li>
                                                            <li><a href="#">Cockatoo</a></li>
                                                            <li><a href="#">Canary</a></li>
                                                            <li><a href="#">Toucan</a></li>
                                                            <li><a href="#">Caique</a></li>
                                                            <li><a href="#">Duck</a></li>
                                                            <li><a href="#">Amazon Parrot</a></li>
                                                            <li><a href="#">Goose</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>


                                        </div>
                                    </div>
                                </div>
                                <div class="sidebar__filter">
                                    <div class="section-title">
                                        <h4>Shop by price</h4>
                                    </div>
                                    <div class="filter-range-wrap">
                                        <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                                             data-min="33" data-max="99"></div>
                                        <div class="range-slider">
                                            <div class="price-input">
                                                <p>Price:</p>
                                                <input type="text" id="minamount">
                                                <input type="text" id="maxamount">
                                            </div>
                                        </div>
                                    </div>
                                    <a href="#">Filter</a>
                                </div>

                                <div class="sidebar__color">
                                    <div class="section-title">
                                        <h4>Shop by color</h4>
                                    </div>
                                    <div class="size__list color__list">
                                        <label for="black">
                                            Blacks
                                            <input type="checkbox" id="black">
                                            <span class="checkmark"></span>
                                        </label>
                                        <label for="whites">
                                            Whites
                                            <input type="checkbox" id="whites">
                                            <span class="checkmark"></span>
                                        </label>
                                        <label for="reds">
                                            Reds
                                            <input type="checkbox" id="reds">
                                            <span class="checkmark"></span>
                                        </label>
                                        <label for="greys">
                                            Greys
                                            <input type="checkbox" id="greys">
                                            <span class="checkmark"></span>
                                        </label>
                                        <label for="blues">
                                            Blues
                                            <input type="checkbox" id="blues">
                                            <span class="checkmark"></span>
                                        </label>
                                        <label for="beige">
                                            Beige Tones
                                            <input type="checkbox" id="beige">
                                            <span class="checkmark"></span>
                                        </label>
                                        <label for="greens">
                                            Greens
                                            <input type="checkbox" id="greens">
                                            <span class="checkmark"></span>
                                        </label>
                                        <label for="yellows">
                                            Yellows
                                            <input type="checkbox" id="yellows">
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-9 col-md-9">
                            <div class="row">
                            <c:set var="productList" value="${sessionScope.PRODUCT_LIST}"></c:set>
                            <c:if test="${not empty productList}">
                                <c:forEach items="${productList}" var="dto" varStatus="counter">
                                    <div class="col-lg-4 col-md-6">
                                        <div class="product__item">
                                            <div class="product__item__pic set-bg"
                                                 data-setbg="${dto.image}"
                                                 style="background-image: url(&quot;${dto.image}&quot;);">
                                                <c:if test="${dto.quantity_Available == 0}">
                                                    <div class="label stockout stockblue">Out Of Stock</div>
                                                </c:if>
                                                <c:if test="${dto.discount != 0 && dto.quantity_Available != 0}">
                                                    <div class="label stockout" style="background: rgb(202,21,21);">Sale ${util.FormatDiscount(dto.discount)}%</div>
                                                </c:if>
                                                <ul class="product__hover">
                                                    <div class="">
                                                        <div>
                                                            <li><a href="${dto.image}"
                                                                   class="image-popup">
                                                                    <button class="">
                                                                        <i class="fa-solid fa-magnifying-glass-plus"></i>
                                                                    </button></a>
                                                            </li>
                                                            <li>
                                                                <form action="product" method="post">
                                                                    <button>
                                                                        <i class="fa-regular fa-eye"></i>
                                                                        <input type="hidden" name="txtproductID" value="${dto.productID}"/>
                                                                        <input type="hidden" name="txtproductName" value="${dto.product_Name}"/>
                                                                        <input type="hidden" name="txtproductTypeID" value="${dto.product_TypeID}"/>
                                                                        <input type="hidden" name="txtAge" value="${dto.age}"/>
                                                                        <input type="hidden" name="txtGender" value="${dto.gender}"/>
                                                                        <input type="hidden" value="View Detail">
                                                                    </button>
                                                                </form>
                                                            </li>
                                                            <li>
                                                                <form action="product_list" method="GET">
                                                                    <c:if test="${dto.quantity_Available != 0}">
                                                                        <button name="btAction" value="Addtocart" type="submit">
                                                                            <i class="fa-solid fa-cart-plus"></i>
                                                                        </button>
                                                                    </c:if>
                                                                    <input type="hidden" name="txtproductID" value="${dto.productID}"/>
                                                                    <input type="hidden" name="txtproductName" value="${dto.product_Name}"/>
                                                                    <input type="hidden" name="txtServiceID" value="1" />
                                                                    <input type="hidden" name="category_Name" value="${dto.category_Name}"/>
                                                                    <input type="hidden" name="quantity_Available" value="${dto.quantity_Available}"/>
                                                                    <input type="hidden" name="quantity_MaleBird" value="${dto.quantity_MaleBird}"/>
                                                                    <input type="hidden" name="quantity_FemaleBird" value="${dto.quantity_FemaleBird}"/>
                                                                    <input type="hidden" name="quantity_Sold" value="${dto.quantity_Sold}"/>
                                                                    <input type="hidden" name="price" value="${dto.price}"/>
                                                                    <input type="hidden" name="txtDiscount" value="${dto.discount}"/>
                                                                    <input type="hidden" name="image" value="${dto.image}"/>
                                                                    <input type="hidden" name="txtAge" value="${dto.age}"/>
                                                                    <input type="hidden" name="color" value="${dto.color}"/>
                                                                    <input type="hidden" name="txtGender" value="${dto.gender}"/>
                                                                    <input type="hidden" name="quantity_Buy" value="1" />
                                                                    <input type="hidden" name="lastSearch" value="${param.lastSearch}"/>
                                                                </form>
                                                            </li>
                                                        </div>
                                                    </div>
                                                </ul>
                                            </div>
                                            <div class="product__item__text">
                                                <h6><a href="#">${dto.product_Name}</a></h6>
                                                <div class="rating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <div class="product__price">
                                                    <c:if test="${dto.discount == 0}">
                                                        ${util.FormatPrice(dto.price)}
                                                    </c:if>
                                                    <c:if test="${dto.discount != 0}">
                                                        ${util.FormatPrice(dto.price - dto.price * dto.discount)}
                                                        <span>${util.FormatPrice(dto.price)}</span>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>

                            <div class="col-lg-12 text-center">
                                <div class="pagination__option">

                                    <c:set var="pt" value="productType=${sessionScope.PRODUCT_TYPE}"></c:set>
                                    <c:if test="${not empty requestScope.SEARCH_VALUE}">
                                        <c:set var="search" value="lastSearch=${requestScope.SEARCH_VALUE}"></c:set>
                                    </c:if>

                                    <c:if test="${requestScope.indexCurrent > 1}">
                                        <a href="product_list?${pt}&${search}&page=1"><i class="fa fa-angle-double-left"></i></a>
                                        <a href="product_list?${pt}&${search}&page=${indexCurrent-1}"><i class="fa fa-angle-left"></i></a>
                                        </c:if>

                                    <c:forEach begin="${requestScope.START}" end="${requestScope.END}" var="i">
                                        <a class="${requestScope.indexCurrent==i ? "active" : ""}" href="product_list?${pt}&${search}&page=${i}">${i}</a>
                                    </c:forEach>

                                    <c:if test="${requestScope.indexCurrent<requestScope.endPage}">
                                        <a href="product_list?${pt}&${search}&page=${requestScope.indexCurrent+1}"><i class="fa fa-angle-right"></i></a>
                                        <a href="product_list?${pt}&${search}&page=${requestScope.endPage}"><i class="fa fa-angle-double-right"></i></a>
                                        </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <!--</footer> -->
        <footer>
            <jsp:include page="/components/footer.jsp"></jsp:include>
        </footer>
        <!-- Footer Section End -->

        <!-- Js Plugins -->
        <script src="./assets/js/jquery-3.3.1.min.js"></script>
        <script src="./assets/js/bootstrap.min.js"></script>
        <script src="./assets/js/jquery.magnific-popup.min.js"></script>
        <script src="./assets/js/jquery-ui.min.js"></script>
        <script src="./assets/js/jquery.countdown.min.js"></script>
        <script src="./assets/js/jquery.slicknav.js"></script>
        <script src="./assets/js/owl.carousel.min.js"></script>
        <script src="./assets/js/jquery.nicescroll.min.js"></script>
        <script src="./assets/js/main.js"></script>
        <script src="https://kit.fontawesome.com/46d5dcf0b7.js" crossorigin="anonymous"></script>


    </body>



</html>