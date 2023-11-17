
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>MyOrder</title>
        <link rel="stylesheet" href="./assets/css/cart.css">
        <link rel="stylesheet" href="./assets/css/homePage.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    </head>

    <body>
        <!-- header -->
        <jsp:include page="/components/header.jsp"></jsp:include>
            <!-- header -->
            <div class="container py-5 h-100 ">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12">
                        <div class="card card-registration card-registration-2" style="border-radius: 15px;">
                            <div class="card-body p-0">
                                <div class="row g-0">
                                <jsp:include page="/components/customerSidebar.jsp"></jsp:include>
                                    <div class="col-lg-9">
                                        <div class="p-5">
                                            <div class="d-flex justify-content-between align-items-center mb-3">
                                                <h1 class="fw-bold mb-0 text-black" style="color: rgb(13,103,128);">
                                                    ${requestScope.SERVICE_ID == 1 ? 'My order' : 'My booking'}
                                                </h1>
                                            </div>
                                            <form action="Order">
                                                <div class="mb-4 justify-content-between align-items-sm-start">
                                                    <div class="col-md-4 col-lg-6 col-xl-6">
                                                        <input type="submit" name="Status" value="All" class="btn btn-secondary ${STATUS_ORDER == '' ? 'active' : ''}">
                                                    <input type="submit" name="Status" value="Processing" class="btn btn-secondary ${STATUS_ORDER == 'Processing' ? 'active' : ''}">
                                                    <input type="submit" name="Status" value="Delivering" class="btn btn-secondary ${STATUS_ORDER == 'Delivering' ? 'active' : ''}">
                                                    <input type="submit" name="Status" value="Complete" class="btn btn-secondary ${STATUS_ORDER == 'Complete' ? 'active' : ''}">
                                                    <input type="submit" name="Status" value="Canceled" class="btn btn-secondary ${STATUS_ORDER == 'Canceled' ? 'active' : ''}">
                                                    <input type="hidden" name="txtServiceID" value="${requestScope.SERVICE_ID}" >
                                                </div>
                                            </div>
                                        </form>


                                        <hr class="my-4">
                                        <c:set var="orderList" value="${sessionScope.ORDER_LIST}"></c:set>
                                        <c:if test="${not empty orderList}">
                                            <jsp:useBean id="util" class="Utils.FormatCurrency"></jsp:useBean>
                                            <jsp:useBean id="odDao" class="Daos.OrderDetailDAO"></jsp:useBean>
                                            <c:forEach var="order" items="${orderList}">
                                                <div class="product">
                                                    <div class="product-element">
                                                        <div class="row d-flex justify-content-between align-items-center bg-grey"
                                                             style="margin-bottom: 15px; padding: 10px; border-radius: 10px;">
                                                            <div class="d-flex align-content-center">
                                                                <div class="col-10 col-lg-10 col-xl-10 d-flex align-items-center"
                                                                     style="">
                                                                    <div class="d-flex">
                                                                        <h6 class="mb-0 text-sm-start">Order code: #${order.orderID}</h6>
                                                                        <h6 class="mb-0 text-sm-center"
                                                                            style="margin: 0 10px 0 10px;"> |
                                                                        </h6>
                                                                        <h6 class="mb-0 text-sm-end">Order date: ${order.orderDateFormat}</h6>
                                                                    </div>
                                                                    <div class=" align-content-center">
                                                                        <div class="justify-content-center align-content-center mb-0"
                                                                             style="background-color: rgb(13,103,128); width: fit-content; padding: 5px 10px 5px 10px; border-radius: 5px; color: azure; margin:0 10px 0 10px;">
                                                                            <h6 class="mb-0">${order.status}
                                                                            </h6>
                                                                        </div>
                                                                    </div>
                                                                    <c:if test="${not empty order.form_Receipt}">
                                                                        <div class=" justify-content-center align-content-center">
                                                                            <div class="d-flex"
                                                                                 style="margin:0 10px 0  0;">
                                                                                <h6 class="mb-0 text-sm-start">Payment: ${order.payBy}</h6>
                                                                            </div>
                                                                        </div>
                                                                    </c:if>
                                                                </div>
<!--                                                                <div class="col-2 col-lg-2 col-xl-2 d-flex align-items-center"
                                                                     style="">
                                                                    <div class=" align-content-center justify-content-end">
                                                                        <a href="#"class="text-muted text-decoration-none see_details_tag">
                                                                            See details
                                                                            <i class="fa-solid fa-arrow-right"></i></a>
                                                                        </a>
                                                                    </div>
                                                                </div>-->
                                                            </div>
                                                            <div class="col-md-12 col-lg-12 col-xl-12 d-flex"style=" margin-top: 8px;">
                                                                <c:if test="${not empty order.form_Receipt}">
                                                                    <div class=" align-content-center">
                                                                        <div class="d-flex">
                                                                            <h6 class="mb-0 text-sm-start">Receiving method: ${order.form_Receipt} </h6>
                                                                        </div>
                                                                    </div>
                                                                    <h6 class="mb-0 text-sm-center"
                                                                        style="margin: 0 10px 0 10px;"> |
                                                                    </h6>
                                                                </c:if>
                                                                <div class=" align-content-center">
                                                                    <div class="d-flex">
                                                                        <h6 class="mb-0 text-sm-start">Service: ${order.serviceName} </h6>
                                                                    </div>
                                                                </div>

                                                                <c:if test="${order.total_Order == 0}">
                                                                    <h6 class="mb-0 text-sm-center"
                                                                        style="margin: 0 10px 0 10px;"> |
                                                                    </h6>
                                                                    <div class=" align-content-center ">
                                                                        <h6 class="text-sm-start">Deposit price: ${util.FormatPrice(order.deposit_Price)}</h6>
                                                                    </div>
                                                                </c:if>
                                                                <c:if test="${order.total_Order != 0}">
                                                                    <h6 class="mb-0 text-sm-center"
                                                                        style="margin: 0 10px 0 10px;"> |
                                                                    </h6>
                                                                    <div class=" align-content-center ">
                                                                        <h6 class="text-sm-start">Total price: ${util.FormatPrice(order.total_Order + order.delivery_charges)}</h6>
                                                                    </div>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row d-flex mt-3">
                                                        <c:forEach var="od" items="${odDao.getOrderDetailByOrderID(order.orderID)}">
                                                            <div
                                                                class="row mb-6 col-md-6 col-xl-6 d-flex align-items-center mb-4">
                                                                <div class="col-md-2 col-lg-2 col-xl-2">
                                                                    <img src="${od.image}"
                                                                         class="img-fluid rounded-3" alt="Bird Image">
                                                                </div>
                                                                <div class="col-md-5 col-lg-5 col-xl-5 ">
                                                                    <div class="">
                                                                        <h6 class="text-black mb-0">${od.name}</h6>
                                                                    </div>
                                                                    <div class="">
                                                                        <h6 class="text-black mb-0">Category: ${od.cate_name}</h6>
                                                                    </div> 
                                                                    <div class="d-flex">
                                                                        <div class=" ">
                                                                            <h6 class="mb-0 text-sm-center">Qty: ${od.quantityBuy}</h6>
                                                                        </div>
                                                                        <div class="">
                                                                            <h6 class="mb-0 text-sm-center"> x </h6>
                                                                        </div>
                                                                        <div class="">
                                                                            <h6 class="mb-0">${util.FormatPrice(od.price)}</h6>
                                                                        </div>
                                                                    </div>


                                                                </div>

                                                                <div class="col-md-5 col-lg-5 col-xl-5 ">
                                                                    <c:if test="${not empty od.color}">
                                                                        <div class="">
                                                                            <h6 class="text-black mb-0">Color: ${od.color}</h6>
                                                                        </div>
                                                                        <div class="">
                                                                            <h6 class="text-black mb-0">Age: ${od.age}</h6>
                                                                        </div>
                                                                        <div class="">
                                                                            <h6 class="text-black mb-0">Gender: ${od.gender}</h6>
                                                                        </div>
                                                                    </c:if>
                                                                    <c:if test="${od.quantity_MaleBird !=0 && od.quantity_FemaleBird !=0}">

                                                                        <div class="">
                                                                            <h6 class="text-black mb-0">Male baby bird: ${od.quantity_MaleBird}</h6>
                                                                        </div> 
                                                                        <div class="">
                                                                            <h6 class="text-black mb-0">Female baby bird: ${od.quantity_FemaleBird}</h6>
                                                                        </div>  
                                                                    </c:if>
                                                                </div>
                                                            </div>
                                                        </c:forEach>
                                                    </div>

                                                    <c:if test="${order.serviceID != 1}">
                                                        <form action="Service_Tracking" class="col-12 mt-3 d-flex justify-content-end">
                                                            <input type="hidden" name="txtOrderID" value="${order.orderID}">
                                                            <button type="submit" class="btn btn-secondary" style="margin: 3px; background-color:rgb(13,103,128);">See Bird Nest Tracking</button>
                                                        </form>
                                                    </c:if>
                                                    <c:if test="${order.status == 'Wait for confirmation' || order.status != 'Cancel' && order.serviceID != 1}">
                                                        <form action="CancelOrder" class="col-12 mt-3 d-flex justify-content-end">
                                                            <button type="submit" class="btn btn-secondary" style="margin: 3px; background-color:rgb(13,103,128);">Cancel</button>
                                                            <input type="hidden" name="orderID" value="${order.orderID}">
                                                            <input type="hidden" name="txtServiceID" value="${order.serviceID}">
                                                            <input type="hidden" name="status" value="${order.status}">
                                                        </form>
                                                    </c:if>

                                                    <c:if test="${order.status == 'Complete'}">
                                                        <div class="col-12 mt-3 d-flex justify-content-end">
                                                            <button type="button" class="btn btn-secondary" style="margin: 3px; background-color:rgb(13,103,128);">Buy again</button>
                                                            <button type="button" class="btn btn-secondary" style="margin: 3px; background-color:rgb(13,103,128);">View rate</button>
                                                        </div>
                                                    </c:if>
                                                    <hr class="my-4">
                                                    <input type="hidden" value=" ${odDao.orderTailList.clear()}">
                                                </div>
                                            </c:forEach>
                                        </c:if>

                                        <c:if test="${empty orderList}">
                                            <div class="container-fluid  mt-100 justify-content-center align-content-center" style="margin:auto">
                                                <div class="row">

                                                    <div class="col-md-12" >

                                                        <div class="card">

                                                            <div class="card-body cart" >
                                                                <div class="col-sm-12 empty-cart-cls text-center">
                                                                    <img src="https://theme.hstatic.net/1000360022/1001086135/14/policies_icon_2.png?v=1441" width="130" height="130"
                                                                         class="img-fluid mb-4 mr-3">
                                                                    <h3><strong>You don't have any orders yet</strong></h3>
                                                                    <a href="#" class="btn btn-primary cart-btn-transform m-3" style="background-color: rgb(13,103,128);" data-abc="true">Continue shopping</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>


        <!-- footer -->
        <jsp:include page="/components/footer.jsp"></jsp:include>
        <!-- close footer -->
    </body>

</html>
