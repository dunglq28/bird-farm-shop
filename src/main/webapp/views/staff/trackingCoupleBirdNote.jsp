<%-- 
    Document   : trackingCoubpleBirdNote
    Created on : Oct 27, 2023, 2:04:37 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tracking Note</title>
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
            integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
            crossorigin="anonymous"
            />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
            integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <link rel="stylesheet" href="../../assets/css/dashboard.css"/>
        <link rel="stylesheet" href="../../assets/css/trackingNote.css"/>
    </head>
    <body>
        <jsp:include page="../../components/sideBar.jsp"></jsp:include>
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
                    <form>
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
                                    value="01"
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
                                    ></textarea>
                            </div>
                        </div>
                        <div class="form-group row add-note">
                            <input type="submit" value="Cancel" />
                            <input type="submit" value="Add note" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
