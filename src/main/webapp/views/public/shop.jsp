
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping</title>
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
            integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
            />
        <link rel="stylesheet" href="./assets/css/homePage.css">
        <link rel="stylesheet" href="./assets/css/shop.css">
    </head>
    <body>
        <jsp:include page="/components/header.jsp"></jsp:include>
            <div class="container">
                <div class="row">
                    <div class="category col-lg-3">
                        <div class="sidebar">
                            <div class="sidebar_item">
                                <h3>Categories</h3>
                                <ul>
                                    <li><a href="#">Bird's category</a></li>
                                    <li><a href="#">Bird's category</a></li>
                                    <li><a href="#">Bird's category</a></li>
                                    <li><a href="#">Bird's category</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="product col-lg-9">
                        <div class="fiter_item_wrp">
                            <div class="fiter_item">
                                <span>Sort by</span>
                                <div>
                                    <a class="active-sort" href="#" >Mới nhất</a>
                                </div>
                                <div>
                                    <a>Bán chạy</a>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                        <c:set var="birdList" value="${sessionScope.BIRD_LIST}"></c:set>
                        <c:if test="${not empty birdList}">
                            <c:forEach items="${birdList}" var="dto" varStatus="counter">
                                <div class="col-lg-4 product_item_wrp">
                                    <div class="product_item">
                                        <div class="product_item_img">
                                            <img src="${dto.image}" alt=""/>
                                            <div class="product_item_img_hover">
                                                <div class="view_detail">
                                                    <form action="product" method="get">
                                                        <i class="fa-solid fa-eye"></i>
                                                        <!--<input type="hidden" name="txtBirdID" value="${dto.birdID}"/>-->
                                                        <input type="hidden" name="txtBirdName" value="${dto.bird_Name}"/>
                                                        <input type="hidden" name="txtAge" value="${dto.age}"/>
                                                        <input type="hidden" name="txtGender" value="${dto.gender}"/>
                                                        <input type="submit" value="View Detail">
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="product_item_text">
                                            <h5>
                                                <a href="#">${dto.bird_Name}</a>
                                            </h5>
                                            <h5>${dto.priceFormat}</h5>
                                            <div class="add_to_cart">
                                                <form action="product-list" method="POST">
                                                    <input type="hidden" name="BirdID" value="${dto.birdID}"/>
                                                    <input type="hidden" name="BirdName" value="${dto.bird_Name}"/>
                                                    <input type="hidden" name="category_Name" value="${dto.category_Name}"/>
                                                    <input type="hidden" name="quantity_Available" value="${dto.quantity_Available}"/>
                                                    <input type="hidden" name="price" value="${dto.price}"/>
                                                    <input type="hidden" name="image" value="${dto.image}"/>
                                                    <input type="hidden" name="age" value="${dto.age}"/>
                                                    <input type="hidden" name="color" value="${dto.color}"/>
                                                    <input type="hidden" name="gender" value="${dto.gender}"/>
                                                    <input type="hidden" name="quantity_Buy" value="1" />
                                                    <input type="hidden" name="lastSearch" value="${param.lastSearch}"/>
                                                    <button name="btAction" value="Addtocart" type="submit">Add to cart</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                    </div>
                    <div class="row">
                        <jsp:useBean id="dao" class="Daos.BirdDAO"></jsp:useBean>
                            <div class="pagination d-flex justify-content-center">
                            <c:if test="${indexCurrent > 1}">
                                <a href="product-list?page=1">&laquo;</a>
                                <a href="product-list?page=${indexCurrent-1}">&lsaquo;</a>
                            </c:if>

                            <c:forEach begin="${sessionScope.START}" end="${sessionScope.END}" var="i">
                                <a class="${indexCurrent==i ? "active" : ""}" href="product-list?page=${i}">${i}</a>
                            </c:forEach>

                            <c:if test="${indexCurrent<dao.numberPage}">
                                <a href="product-list?page=${indexCurrent+1}">&rsaquo;</a>
                                <a href="product-list?page=${dao.numberPage}">&raquo;</a>
                            </c:if>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="/components/footer.jsp"></jsp:include>
    </body>
</html>
