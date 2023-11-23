
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
            .sidebar .menu .list-cart-icon .cart-number {
                bottom: 15px;
            }
        </style>

    </head>
    <body>
        <jsp:useBean id="util" class="Utils.FormatCurrency"></jsp:useBean>
        <jsp:include page="/components/sideBar.jsp"></jsp:include>

            <div class="main--content">
                <div class="header-wrapper">
                    <div class="header--title">
                        <span>Primary</span>
                        <h2>Order Management</h2>
                    </div>
                    <div class="user--info">
                        <form action="viewMyOrder-staff" class="search--box">
                            <i class="fa-solid fa-search"></i>
                            <input name="lastSearch" value="${param.lastSearch}" type="text" placeholder="Search"/>
                        <input type="hidden" name="txtServiceID" value="${requestScope.SERVICE_ID}"/>
                        <button type="submit"></button>
                    </form>
                    ${sessionScope.ACCOUNT.fullName}
                </div>
            </div>
            <div class="tabular--wrapper">
                <c:if test="${requestScope.SERVICE_ID == 1}">
                    <h3 class="main--title">My Order</h3>
                </c:if>
                <c:if test="${requestScope.SERVICE_ID != 1}">
                    <h3 class="main--title">My Booking</h3>
                </c:if>
                <form action="viewMyOrder-staff">
                    <div class="mb-4 justify-content-between align-items-sm-start">
                        <div class="col-md-4 col-lg-6 col-xl-6">
                            <input type="submit" name="Status" value="All" class="btn btn-secondary ${STATUS_ORDER == '' ? 'active' : ''}" >
                            <input type="submit" name="Status" value="Processing" class="btn btn-secondary ${STATUS_ORDER == 'Processing' ? 'active' : ''}"  >
                            <input type="submit" name="Status" value="Delivering" class="btn btn-secondary ${STATUS_ORDER == 'Delivering' ? 'active' : ''}"  >
                            <input type="submit" name="Status" value="Complete" class="btn btn-secondary ${STATUS_ORDER == 'Complete' ? 'active' : ''}"  >
                            <input type="hidden" name="txtServiceID" value="${requestScope.SERVICE_ID}" >
                        </div>
                    </div>
                </form>

                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>OrderID</th>
                                <th>Service</th>
                                <th>Customer Name</th>
                                <th>Order Date</th>
                                    <c:if test="${requestScope.SERVICE_ID != 1}">
                                    <th>Deposit Price</th>
                                    </c:if>
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
                                        <td><a href="viewDetailOrder?OrderID=${dto.orderID}" class="order-detail">${dto.orderID}</a></td>
                                        <td>${dto.serviceName}</td>
                                        <td>${dto.accountName}</td>
                                        <td>${util.FormatDate(dto.orderDate)}</td>
                                        <c:if test="${requestScope.SERVICE_ID != 1}">
                                            <td>${util.FormatPrice(dto.deposit_Price)}</td>
                                        </c:if>
                                        <td>${util.FormatPrice(dto.total_order_final)}</td>
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
                                                <input type="hidden" name="txtServiceID" value="${sessionScope.SERVICE_ID}" >
                                            </form>
                                        </td>
                                        <td>
                                            <c:if test="${requestScope.SERVICE_ID != 2}">
                                                <button type="button" class="btn btn-secondary cancel-btn" style="border-radius: 7px;
                                                        border: 2px solid rgb(13, 103, 128);
                                                        text-align: center;
                                                        padding: 0 10px 0 10px;
                                                        text-align: center; color: black">Cancel</button>
                                            </c:if>

                                            <c:if test="${requestScope.SERVICE_ID != 1}">
                                                <c:if test="${dto.status == 'Wait for confirmation' || dto.status != 'Cancel'}">
                                                    <form action="cancelOrderByStaff" class="col-12  d-flex justify-content-end">
                                                        <button type="submit" class="btn btn-secondary" style="border-radius: 7px;
                                                                border: 2px solid rgb(13, 103, 128);
                                                                text-align: center;
                                                                padding: 0 10px 0 10px;
                                                                text-align: center; color: black;">Cancel</button>
                                                        <input type="hidden" name="orderID" value="${dto.orderID}">
                                                        <input type="hidden" name="txtServiceID" value="${dto.serviceID}">
                                                        <input type="hidden" name="status" value="${dto.status}">
                                                    </form>
                                                </c:if>
                                            </c:if>
                                        </td>
                                    </tr>
                                    <form action="cancelOrderByStaff" class="col-12  d-flex justify-content-end">
                                        <div class="modal" tabindex="-1" role="dialog" id="cancelModal">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content"> 
                                                    <div class="modal-header">
                                                        <h5 class="modal-title">Select an option</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <p>Do you want to add this bird back into inventory?</p>


                                                        <input type="hidden" name="orderID" value="${dto.orderID}">
                                                        <input type="hidden" name="txtServiceID" value="${dto.serviceID}">
                                                        <input type="hidden" name="status" value="${dto.status}">

                                                        <input type="submit" value="Yes"  data-option="1"></button>
                                                        <input type="submit" value="No"  data-option="2"></button>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
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
                        <a href="viewMyOrder-staff?txtServiceID=${requestScope.SERVICE_ID}&Status=${STATUS_ORDER}&${search}&page=1"><i class="fa fa-angle-double-left"></i></a>
                        <a href="viewMyOrder-staff?txtServiceID=${requestScope.SERVICE_ID}&Status=${STATUS_ORDER}&${search}&page=${requestScope.indexCurrent-1}"><i class="fa fa-angle-left"></i></a>
                        </c:if>

                    <c:forEach begin="${requestScope.START}" end="${requestScope.END}" var="i">
                        <a class="${requestScope.indexCurrent==i ? "active" : ""}" href="viewMyOrder-staff?txtServiceID=${requestScope.SERVICE_ID}&Status=${STATUS_ORDER}&${search}&page=${i}">${i}</a>
                    </c:forEach>

                    <c:if test="${requestScope.indexCurrent<requestScope.endPage}">
                        <a href="viewMyOrder-staff?txtServiceID=${requestScope.SERVICE_ID}&Status=${STATUS_ORDER}&${search}&page=${requestScope.indexCurrent+1}"><i class="fa fa-angle-right"></i></a>
                        <a href="viewMyOrder-staff?txtServiceID=${requestScope.SERVICE_ID}&Status=${STATUS_ORDER}&${search}&page=${requestScope.endPage}"><i class="fa fa-angle-double-right"></i></a>
                        </c:if>
                </div>
            </div>  
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

        <script>
                                                    function submit() {
                                                        document.querySelector(".myForm").onsubmit();
                                                        document.querySelector(".myOrder").onsubmit();
                                                    }


        </script>
        <script>
            const cancelButtons = document.querySelectorAll('.cancel-btn');

            cancelButtons.forEach(cancelButton => {
                cancelButton.addEventListener('click', function () {
                    const cancelModal = new bootstrap.Modal(document.getElementById('cancelModal'));
                    cancelModal.show();
                });
            });
            const optionButtons = document.querySelectorAll('.option-btn');
            optionButtons.forEach(optionButton => {
                optionButton.addEventListener('click', function () {
                    const selectedOption = this.getAttribute('data-option');
                    const cancelModal = bootstrap.Modal.getInstance(document.getElementById('cancelModal'));
                    cancelModal.hide();
                });
            });
        </script>
    </body>
</html>