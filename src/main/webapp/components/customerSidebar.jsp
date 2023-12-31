<div class="col-lg-3 bg-grey">
    <div class="p-5">

        <div class="row mb-12 d-flex justify-content-between align-items-center">
            <div class="col-md-4 col-lg-4 col-xl-4">
                <img src="https://haycafe.vn/wp-content/uploads/2022/02/Avatar-trang-den.png"
                     class="img-fluid rounded-3" alt="Bird Image">
            </div>
            <div class="col-md-8 justify-content-center">
                <h5 class="text-black mb-0">${sessionScope.ACCOUNT.fullName}</h5>
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <a href="#" class="change-infor-link text-decoration-none">
                        <h6 class="mb-0 text-muted ">Change account</h6>
                    </a>
                </div>
            </div>
        </div>
        <hr>
        <div class="mb-5 mt-5">
            <div class="Promotion-received"></div>
            <div class="Promotion-received-element mb-3">
                <a href="Customer" class="text-muted text-decoration-none">
                    <h5>Account information</h5>
                </a>
            </div>
            <hr class="my-4">
            <div class="Promotion-received-element mb-3">
                <a href="Order?txtServiceID=1" class="text-muted text-decoration-none" ${requestScope.SERVICE_ID == 1 ? 'style="color: rgb(0, 155, 198) !important;"' : ''} >
                    <h5 >My order</h5>
                </a>
            </div>
            <hr class="my-4">
            <div class="Promotion-received-element mb-3">
                <a href="Order?txtServiceID=2" class="text-muted text-decoration-none" ${requestScope.SERVICE_ID == 2 ? 'style="color: rgb(0, 155, 198) !important;"' : ''}>
                    <h5>My booking</h5>
                </a>
            </div>
<!--            <hr>
            <div class="Promotion-received-element mb-3">
                <a href="#" class="text-muted text-decoration-none">
                    <h5>Delivery address book</h5>
                </a>
            </div>
            <hr>
            <div class="Promotion-received-element mb-3">
                <a href="#" class="text-muted text-decoration-none">
                    <h5>Repurchase</h5>
                </a>
            </div>
            <hr>
            <div class="Promotion-received-element mb-3">
                <a href="#" class="text-muted text-decoration-none">
                    <h5>Q&A</h5>
                </a>
            </div>-->

        </div>

        <hr class="my-4">
    </div>
</div>