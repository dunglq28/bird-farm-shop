<%-- 
    Document   : trackingCoupleBirdNote
    Created on : Nov 3, 2023, 2:30:41 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tracking Note</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
            integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <link rel="stylesheet" href="./assets/css/dashboard.css" />
        <link rel="stylesheet" href="./assets/css/trackingNote.css"/>
    </head>
    <body>
        <jsp:include page="/components/sideBar.jsp"></jsp:include>  
        <c:set var="tracking" value="${requestScope.BIRD_NEST_TRACKING}"/>
        <c:set var="orderId" value="${requestScope.ORDER_ID}"/>
        <c:set var="eggError" value="${requestScope.EGG_ERROR}" />
        <div class="main--content">
            <div class="header-wrapper">
                <div class="header--title">
                    <h2>Tracking Note</h2>
                </div>
                <div class="user--info">
                    ${sessionScope.ACCOUNT.fullName}
                </div>
            </div>
            <div class="tabular--wrapper">
                <div class="form-wrapper d-flex flex-column">
                    <form action="updateStatusTracking" method="POST">
                        <div class="form-group row progressStatus">
                            <label for="status" class="col-sm-3 col-form-label">Progress</label>
                            <div class="col-sm-9">
                                <input type="hidden" value="${tracking.bird_Nest_ID}" name="birdNestId"/>
                                <input type="hidden" name="orderId" value="${orderId}" />
                                <select class="col-5 form-control" name="progress" onchange="this.form.submit()">
                                    <c:choose>
                                        <c:when test="${tracking.status eq 'Processing'}">
                                            <option selected>Processing</option>
                                            <option>Mating</option>
                                            <option>Tracking Eggs</option>
                                            <option>Tracking Baby Birds</option>
                                            <option>Final Payment</option>
                                        </c:when>
                                    </c:choose>

                                    <c:choose>
                                        <c:when test="${tracking.status eq 'Mating'}">
                                            <option selected>Mating</option>
                                            <option>Tracking Eggs</option>
                                            <option>Tracking Baby Birds</option>
                                            <option>Final Payment</option>
                                        </c:when>
                                    </c:choose>

                                    <c:choose>
                                        <c:when test="${tracking.status eq 'Tracking Eggs'}">
                                            <option selected>Tracking Eggs</option>
                                            <option>Tracking Baby Birds</option>
                                            <option>Final Payment</option>
                                        </c:when>
                                    </c:choose>

                                    <c:choose>
                                        <c:when test="${tracking.status eq 'Tracking Baby Birds'}">
                                            <option selected>Tracking Baby Birds</option>
                                            <option>Final Payment</option>
                                        </c:when>
                                    </c:choose>

                                    <c:choose>
                                        <c:when test="${tracking.status eq 'Final Payment'}">
                                            <option selected>Final Payment</option>
                                        </c:when>
                                    </c:choose>

                                    <c:choose>
                                        <c:when test="${tracking.status eq 'Payment Success'}">
                                            <option selected>Payment Success</option>
                                        </c:when>
                                    </c:choose>
                                </select>
                            </div>
                        </div>
                    </form>
                    <form action="addTrackingNote" method="POST" id="formNoteTracking" enctype="multipart/form-data">
                        <div class="form-group row">
                            <label for="birdNestID" class="col-sm-3 col-form-label"
                                   >Bird Nest ID</label
                            >
                            <div class="col-sm-9">
                                <input
                                    type="text"
                                    readonly
                                    class="form-control-plaintext"
                                    id="birdNestID"
                                    value="${tracking.bird_Nest_ID}"
                                    name="birdNestId"
                                    />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="numberOfEggs" class="col-sm-3 col-form-label"
                                   >Number of eggs</label
                            >
                            <div class="col-sm-9">
                                <c:choose>
                                    <c:when test="${tracking.status != 'Tracking Eggs'}">
                                        <input
                                            type="number"
                                            class="form-control"
                                            id="numberOfEggs"
                                            min="0"
                                            value="${tracking.eggs_Quantity}"
                                            name="numberOfEggs"
                                            readonly
                                            />
                                    </c:when>
                                    <c:otherwise>
                                        <input
                                            type="number"
                                            class="form-control"
                                            id="numberOfEggs"
                                            min="0"
                                            value="${tracking.eggs_Quantity}"
                                            name="numberOfEggs"
                                            />
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="maleBirds" class="col-sm-3 col-form-label"
                                   >Number of male baby birds</label
                            >
                            <div class="col-sm-9">
                                <c:choose>
                                    <c:when test="${tracking.status != 'Tracking Baby Birds'}">
                                            <input
                                                type="number"
                                                class="form-control"
                                                id="maleBirds"
                                                min="0"
                                                value="${tracking.male_Babybird}"
                                                name="maleBirds"
                                                readonly
                                                />
                                    </c:when>
                                    <c:otherwise>
                                        <input
                                            type="number"
                                            class="form-control"
                                            id="maleBirds"
                                            min="0"
                                            value="${tracking.male_Babybird}"
                                            name="maleBirds"
                                            />
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="femaleBirds" class="col-sm-3 col-form-label"
                                   >Number of female baby birds</label>
                            <div class="col-sm-9">
                                <c:choose>
                                    <c:when test="${tracking.status != 'Tracking Baby Birds'}">
                                            <input
                                                type="number"
                                                class="form-control"
                                                id="femaleBirds"
                                                min="0"
                                                value="${tracking.female_Babybird}"
                                                name="femaleBirds"
                                                readonly
                                                />
                                    </c:when>
                                    <c:otherwise>
                                        <input
                                            type="number"
                                            class="form-control"
                                            id="femaleBirds"
                                            min="0"
                                            value="${tracking.female_Babybird}"
                                            name="femaleBirds"
                                            />
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="note" class="col-sm-3 col-form-label">Note</label>
                            <div class="col-sm-9">
                                <textarea
                                    class="form-control"
                                    id="exampleFormControlTextarea1"
                                    rows="3"
                                    name="note"
                                    ></textarea>
                            </div>
                        </div>
                        <div class="form-control-upload" style="border: none;" >
                            <div>
                                <div class="d-flex align-content-center text-center">
                                    <p><input type="file" name="file" onchange="showImage(this);" /></p>
                                    <p><img id="preview" src="" alt="Photo" style="max-height: 100px;" /></p>
                                </div>
                            </div>
                        </div>
                        <c:if test="${not empty eggError}">
                            <div form-group row mb-4>
                                <font style="color: red;">${eggError}</font>
                            </div>
                        </c:if>
                        <div class="form-group row add-note">
                            <input type="hidden" name="orderId" value="${orderId}" />
                            <input type="submit" name="action" value="Cancel" />
                            <input type="submit" name="action" value="Add note" ${tracking.status  eq 'Payment Success' ? 'disabled' : ''} />
                        </div>
                    </form>
                </div>
            </div>
            <script>
                function submitForm() {
                    document.querySelector("#formChangeStatus").onsubmit();
                }
                function showImage(input) {
                    var file = input.files[0];
                    var img = document.getElementById('preview');

                    if (file) {
                        var reader = new FileReader();

                        reader.onload = function (e) {
                            img.src = e.target.result;
                        };

                        reader.readAsDataURL(file);
                    }
                }
            </script>
    </body>
</html>
