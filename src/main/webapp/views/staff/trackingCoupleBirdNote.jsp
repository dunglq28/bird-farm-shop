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
        <jsp:include page="../../components/sideBar.jsp"></jsp:include>
        <c:set var="tracking" value="${requestScope.BIRD_NEST_TRACKING}"/>
        <c:set var="orderId" value="${requestScope.ORDER_ID}"/>
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
                <div class="form-wrapper">
                    <form action="addTrackingNote" method="POST">
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
                                   >Eggs</label
                            >
                            <div class="col-sm-9">
                                <input
                                    type="number"
                                    class="form-control"
                                    id="numberOfEggs"
                                    min="0"
                                    value="${tracking.eggs_Quantity}"
                                    name="numberOfEggs"
                                    />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="maleBirds" class="col-sm-3 col-form-label"
                                   >Male birds</label
                            >
                            <div class="col-sm-9">
                                <input
                                    type="number"
                                    class="form-control"
                                    id="maleBirds"
                                    min="0"
                                    value="${tracking.male_Babybird}"
                                    name="maleBirds"
                                    />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="femaleBirds" class="col-sm-3 col-form-label"
                                   >Female birds</label
                            >
                            <div class="col-sm-9">
                                <input
                                    type="number"
                                    class="form-control"
                                    id="femaleBirds"
                                    min="0"
                                    value="${tracking.female_Babybird}"
                                    name="femaleBirds"
                                    />
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
                        <div class="form-group row">
                            <label for="status" class="col-sm-3 col-form-label">Progress</label>
                            <div class="col-sm-9">
                            <select id="status" class="col-5 form-control" name="progress">
                                <c:choose>
                                    <c:when test="${tracking.status eq 'Processing'}">
                                        <option selected>Processing</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option>Processing</option>
                                    </c:otherwise>
                                </c:choose>

                                <c:choose>
                                    <c:when test="${tracking.status eq 'Mating'}">
                                        <option selected>Mating</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option>Mating</option>
                                    </c:otherwise>
                                </c:choose>

                                <c:choose>
                                    <c:when test="${tracking.status eq 'Tracking Eggs'}">
                                        <option selected>Tracking Eggs</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option>Tracking Eggs</option>
                                    </c:otherwise>
                                </c:choose>
                            </select>
                            </div>
                        </div>
                        <div class="form-group row add-note">
                            <input type="hidden" name="orderId" value="${orderId}" />
                            <input type="submit" name="action" value="Cancel" />
                            <input type="submit" name="action" value="Add note" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
