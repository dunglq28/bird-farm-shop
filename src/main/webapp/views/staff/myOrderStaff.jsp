<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
            />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
            integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <link rel="stylesheet" href="./assets/css/dashboard.css" />
        <link rel="stylesheet" href="./assets/css/homePage.css">

        <title>My Order</title>
        <style>
            .rounded-td {
                border-radius: 7px;
                border: 2px solid rgb(13, 103, 128);
                overflow: hidden;
            }

            .rounded-select {
                border-radius: 7px;
                border: 2px solid rgb(13, 103, 128);
                text-align: center;
                padding: 0 10px 0 10px;
                text-align: center;
                justify-content: center;

            }

            .pagination__option a {
                display: inline-block;
                height: 40px;
                width: 40px;
                border: 1px solid #f2f2f2;
                border-radius: 50%;
                font-size: 14px;
                color: #111111;
                font-weight: 600;
                line-height: 40px;
                text-align: center;
                -webkit-transition: all, 0.3s;
                -o-transition: all, 0.3s;
                transition: all, 0.3s;
                margin-right: 6px;
                text-decoration: none;
            }
            .pagination__option a.active{
                background-color: #0D6780;
                color: white;
                border: 1px solid #0D6780;
            }

            .pagination__option a:last-child {
                margin-right: 0;
            }

            .pagination__option a i {
                font-weight: 600;
            }

            .pagination__option a:hover {
                background: rgb(37,118,140);
                border-color: rgb(37,118,140);
                color: #ffffff;
            }

            .btn.btn-secondary.active {
                 background-color: rgb(13,103,128);
            }
            
            .btn-secondary:hover {
                background-color: rgb(13,103,128);
                
            }
        </style>
    </head>
    <body>
        <jsp:useBean id="util" class="Utils.FormatCurrency"></jsp:useBean>
        <jsp:include page="/components/siveBar.jsp"></jsp:include>

            <div>

            </div>


            <div class="main--content">
                <div class="header-wrapper">
                    <div class="header--title">
                        <span>Primary</span>
                        <h2>Order Management</h2>
                    </div>
                    <div class="user--info">
                        <div class="search--box">
                            <i class="fa-solid fa-search"></i>
                            <input type="text" placeholder="search" />
                        </div>
                    ${sessionScope.ACCOUNT.fullName}
                </div>
            </div>
            <div class="tabular--wrapper">
                <c:if test="${sessionScope.SERVICE_ID == 1}">
                    <h3 class="main--title">My Order</h3>
                    <form action="Order">
                        <div class="mb-4 justify-content-between align-items-sm-start">
                            <div class="col-md-4 col-lg-6 col-xl-6">
                                <input type="submit" name="Status" value="All" class="btn btn-secondary active" >
                                <input type="submit" name="Status" value="Processing" class="btn btn-secondary ${STATUS_ORDER == 'Processing' ? 'active' : ''}"  >
                                <input type="submit" name="Status" value="Delivering" class="btn btn-secondary ${STATUS_ORDER == 'Delivering' ? 'active' : ''}"  >
                                <input type="submit" name="Status" value="Complete" class="btn btn-secondary ${STATUS_ORDER == 'Complete' ? 'active' : ''}"  >
                                <input type="submit" name="Status" value="Wait fot comfirmation" class="btn btn-secondary ${STATUS_ORDER == 'Wait fot comfirmation' ? 'active' : ''}"  >

                                <input type="hidden" name="txtServiceID" value="${requestScope.SERVICE_ID}" >
                            </div>
                        </div>
                    </form>
                </c:if>
                <c:if test="${sessionScope.SERVICE_ID != 1}">
                    <h3 class="main--title">My Booking</h3>
                     <form action="Order">
                        <div class="mb-4 justify-content-between align-items-sm-start">
                            <div class="col-md-4 col-lg-6 col-xl-6">
                                <input type="submit" name="Status" value="All" class="btn btn-secondary active" >
                                <input type="submit" name="Status" value="Processing" class="btn btn-secondary ${STATUS_ORDER == 'Processing' ? 'active' : ''}"  >
                                <input type="submit" name="Status" value="Delivering" class="btn btn-secondary ${STATUS_ORDER == 'Delivering' ? 'active' : ''}"  >
                                <input type="submit" name="Status" value="Complete" class="btn btn-secondary ${STATUS_ORDER == 'Complete' ? 'active' : ''}"  >
                                <input type="submit" name="Status" value="Wait fot comfirmation" class="btn btn-secondary ${STATUS_ORDER == 'Wait fot comfirmation' ? 'active' : ''}"  >

                                <input type="hidden" name="txtServiceID" value="${requestScope.SERVICE_ID}" >
                            </div>
                        </div>
                    </form>
                </c:if>

                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>OrderID</th>
                                <th>Service</th>
                                <th>Customer Name</th>
                                <th>Order Date</th>
                                <th>Total</th>
                                <th>Delivery method</th>
                                <th>Payment method</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                        <div class="tbody-wrapper">
                            <c:set var="order" value="${requestScope.MY_ORDERS_STAFF}"></c:set>
                            <c:if test="${not empty order}">
                                <c:forEach items="${order}" var="dto">
                                    <tr>
                                        <td><a href="" class="order-detail">${dto.orderID}</a></td>
                                        <td>${dto.serviceName}</td>
                                        <td>${dto.accountName}</td>
                                        <td>${util.FormatDate(dto.orderDate)}</td>
                                        <td>${util.FormatPrice(dto.total_Order)}</td>
                                        <td>${dto.form_Receipt}</td>
                                        <td>${dto.payBy}</td>
                                        <td>
                                            <form action="updatedOrders-staff">
                                                <select name="txtNewStatus" onchange="submit()" class="rounded-select" >
                                                    <option ${dto.status == 'Processing' ? 'selected' : '' }>Processing</option>
                                                    <option ${dto.status == 'Delivering' ? 'selected' : '' }>Delivering</option>
                                                    <option ${dto.status == 'Complete' ?'selected' : '' }>Complete</option>
                                                </select>
                                                <input type="hidden" name="txtOrderID" value="${dto.orderID}">
                                                <input type="hidden" name="txtServiceID" value="${session.SERVICE_ID}" >
                                            </form>
                                        </td>

                                        <td>
                                            <div class="action">
                                                <!--<a href="#"><i class="fa-solid fa-check"></i></a>-->
                                                <a href="#"><i class="fa-solid fa-xmark"></i></a>
                                            </div>
                                            <input type="hidden" name="" value="" />
                                            <input type="hidden" name="" value="" />
                                            <input type="hidden" name="" value="" />
                                            <input type="hidden" name="" value="" />
                                            <input type="hidden" name="" value="" />
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
                    <a href="#"><i class="fa fa-angle-double-left"></i></a>
                    <a href="#"><i class="fa fa-angle-left"></i></a>
                    <a class="active" href="#">1</a>
                    <a href="#">2</a>
                    <a href="#">3</a>
                    <a href="#"><i class="fa fa-angle-right"></i></a>
                    <a href="#"><i class="fa fa-angle-double-right"></i></a>
                </div>
            </div>           
        </div>

        <script>
            function submit() {
                document.querySelector(".myForm").onsubmit();
            }
        </script>
        <script src="https://kit.fontawesome.com/46d5dcf0b7.js" crossorigin="anonymous"></script>

    </body>
</html>