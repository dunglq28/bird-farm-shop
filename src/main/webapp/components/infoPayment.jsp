<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div>
    <c:set var="customer" value="${sessionScope.CUSTOMER}"></c:set>
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h4 class="fw-bold mb-0 text-black">Information receive</h4>
        <c:if test="${sessionScope.SERVICE_ID != 2}">
            <a href="shipping?txtServiceID=${sessionScope.SERVICE_ID}" class="change-icon text-decoration-none">
                <h6 class="mb-0 text-muted change_info">Change information</h6>
            </a>
        </c:if>
    </div>
    <div class="d-flex justify-content-between align-items-center mb-1">

        <h6 class="mb-0 text-muted ">${customer.fullName} - ${customer.phone_Number}
        </h6>
    </div>
    <c:if test="${sessionScope.SERVICE_ID != 2}">
        <div class="d-flex justify-content-between align-items-center">
            <h6 class="mb-0 text-muted ">${customer.address}, ${customer.district}, ${customer.city}</h6>
        </div>
    </c:if>
</div>


<c:if test="${sessionScope.SERVICE_ID != 2}">
    <hr class="my-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h4 class="fw-bold mb-0 text-black">Delivery method </h4>
    </div>
    <div class="row mb-4 d-flex justify-content-between align-items-center">
        <div class="form-check">
            <input onchange="submit()" class="form-check-input-2" type="radio" 
                   name="shippingMethod" id="exampleRadios1" value="Fast delivery" ${sessionScope.SHIPPING_METHOD == 'Fast delivery' ? 'checked' : ''}>
            <label class="form-check-label" for="exampleRadios1">
                Fast delivery
            </label>
        </div>
        <div class="form-check fisrt-element">
            <input onchange="submit()" class="form-check-input-1" type="radio" 
                   name="shippingMethod" id="exampleRadios2" value="Receive directly at shop" ${sessionScope.SHIPPING_METHOD == 'Receive directly at shop' ? 'checked' : ''}>
            <label class="form-check-label" for="exampleRadios2">
                Receive directly at shop
            </label>

        </div>
    </div>
</c:if>
<c:if test="${sessionScope.SERVICE_ID != 1}">
    <hr class="my-4">
    <div>
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h4 class="fw-bold mb-0 text-black">Payment method </h4>
        </div>
        <div class="row mb-4 d-flex justify-content-between align-items-center">    
            <div class="form-check">
                <input name="PaymentMethod" class="form-check-input-2" type="radio" checked
                       id="VNPAY" value="VNPAY">
                <label class="form-check-label" for="VNPAY">
                    VNPAY online payment
                    (<a href="#" class="text-decoration-none text-muted">Link VNPAY</a>)
                </label>
            </div>
        </div>
    </div>
</c:if>
