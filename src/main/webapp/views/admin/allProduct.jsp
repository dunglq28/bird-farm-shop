<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" />

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
              integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="./assets/css/dashboard.css" />
        <link rel="stylesheet" href="./assets/css/homePage.css">


        <title>Products</title>

    </head>

    <body>
        <jsp:useBean id="util" class="Utils.FormatCurrency"></jsp:useBean>
        <jsp:include page="/components/sideBar.jsp"></jsp:include>
            <div class="main--content">
                <div class="header-wrapper">
                    <div class="header--title">
                        <span>Primary</span>
                        <h2>Product Management</h2>
                    </div>
                    <div class="user--info">
                        <form action="viewAllProduct" class="search--box">
                            <i class="fa-solid fa-search"></i>
                            <input name="lastSearch" value="${param.lastSearch}" type="text" placeholder="Search" />
                        <button type="submit"></button>
                    </form>
                    ${sessionScope.ACCOUNT.fullName}
                </div>
            </div>
            <div class="tabular--wrapper">

                <div class="d-flex justify-content-between align-items-center mb-3">
                    <div class="d-flex ">
                        <h1 class="fw-bold mb-0 text-black" style="color: #0D6780 !important; margin-right: 8px">Product<h6 class="text-muted align-content-center mt-3">(${requestScope.NUMBER_OF_PRODUCT} product)</h6></h1>

                    </div>
                    <div class="text-end ">
                        <div class="btn btn-primary" style="background: #0D6780; border: #0D6780;width: 50px; ">
                            <a href="createProductPage">
                                <i class="fa-solid fa-plus" style="color: white;"></i>
                            </a>
                        </div>
                    </div> 
                </div>

                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th class="text-center">ProductID</th>
                                <th class="text-center">Product</th>
                                <th class="text-center">Type</th>
                                <th class="text-center">Price</th>
                                <th class="text-center">Discount</th>
                                <th class="text-center">Qty Available</th>
                                <th class="text-center">Qty Matching</th>
                                <th class="text-center">Qty Sold</th>
                                <th class="text-center">Status</th>
                                <th class="text-center">Option</th>
                            </tr>
                        </thead>
                        <tbody>
                        <div class="tbody-wrapper">
                            <c:set  var="proList" value="${requestScope.PRODUCT_LIST}"></c:set>
                            <c:if test="${not empty proList}">
                                <c:forEach  items="${proList}" var="pro">
                                    <tr style="text-align: center !important; align-content: space-around !important">
                                        <td>${pro.productID}</td>
                                        <td>
                                            <div class="d-flex justify-content-lg-start align-items-center">
                                                <div class="" style="max-width: 70px;">
                                                    <img src="${pro.image}" class="img-fluid rounded-3" alt="Bird Image">
                                                </div>
                                                <div class="" style="margin-left: 5px; text-align: center">
                                                    <h6 class="text-black">${pro.product_Name}</h6>
                                                    <c:if test="${pro.product_TypeID == 1}">
                                                        <div class="d-flex ">
                                                            <h6 class=" "> ${pro.age}
                                                            </h6>
                                                            <h6 class="mb-0 text-sm-center " style="margin: 0 5px 0 5px;"> |
                                                            </h6>
                                                            <h6 class=""> ${pro.gender}
                                                            </h6>
                                                        </div>
                                                        <h6 class=""> ${pro.color}</h6>
                                                    </c:if>
                                                    <c:if test="${pro.product_TypeID != 1}">
                                                        <h6 class="text-muted">Male baby bird: ${pro.quantity_MaleBird}</h6>
                                                        <h6 class="text-muted">Female baby bird: ${pro.quantity_FemaleBird}</h6> 
                                                    </c:if>
                                                </div>
                                            </div>
                                        </td>
                                        <td>${pro.product_TypeID == 1 ? 'Bird' : 'Bird Nest'}</td>
                                        <td>${util.FormatPrice(pro.price)}</td>
                                        <td>${util.FormatDiscount(pro.discount)}</td>
                                        <td>${pro.quantity_Available}</td>
                                        <td>${pro.quantity_AreMating}</td>
                                        <td>${pro.quantity_Sold}</td>
                                        <td>
                                            <form action="updateProductStatus">
                                                <select name="status" onchange="submit()" class="rounded-select" >
                                                    <option ${pro.status == 'Enable' ? 'selected' : '' }>Enable</option>
                                                    <option ${pro.status == 'Disable' ? 'selected' : '' }>Disable</option>
                                                </select>
                                                <input type="hidden" name="accountID" value="${dto.accountID}" />
                                                <input type="hidden" name="productID" value="${pro.productID}" />
                                            </form>
                                        </td>
                                        <td>
                                            <div class="d-flex">
                                                <h6 class="mb-0 text-sm-center text-muted" style="margin-right: 10px;">
                                                    <a class="text-decoration-none text-muted" href="updateProduct?ProductID=${pro.productID}">
                                                        <i class="far fa-edit"></i> 
                                                    </a>
                                                </h6>
                                                <h6 class="mb-0 text-sm-center text-muted">
                                                    <a class="text-decoration-none text-muted" href="deleteProduct?ProductID=${pro.productID}">
                                                        <i class="fa-solid fa-delete-left"></i> 
                                                    </a>
                                                </h6>
                                            </div>

                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                        </div>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-lg-12 text-center mt-2">
                <div class="pagination__option" style="text-align: end">
                    <c:if test="${not empty requestScope.SEARCH_VALUE}">
                        <c:set var="search" value="lastSearch=${requestScope.SEARCH_VALUE}"></c:set>
                    </c:if>
                    <c:if test="${requestScope.indexCurrent > 1}">
                        <a href="viewAllProduct?${search}&page=1"><i class="fa fa-angle-double-left"></i></a>
                        <a href="viewAllProduct?${search}&page=${requestScope.indexCurrent-1}"><i class="fa fa-angle-left"></i></a>
                        </c:if>

                    <c:forEach begin="${requestScope.START}" end="${requestScope.END}" var="i">
                        <a class="${requestScope.indexCurrent==i ? "active" : ""}" href="viewAllProduct?${search}&page=${i}">${i}</a>
                    </c:forEach>

                    <c:if test="${requestScope.indexCurrent<requestScope.endPage}">
                        <a href="viewAllProduct?${search}&page=${requestScope.indexCurrent+1}"><i class="fa fa-angle-right"></i></a>
                        <a href="viewAllProduct?${search}&page=${requestScope.endPage}"><i class="fa fa-angle-double-right"></i></a>
                        </c:if>
                </div>
            </div>  
        </div>

        <script>
            function submit() {
                document.querySelector(".myForm").onsubmit();
                document.querySelector(".myOrder").onsubmit();
            }
        </script>
    </body>

</html>