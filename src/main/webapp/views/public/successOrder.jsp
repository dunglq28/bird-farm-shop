<%-- 
    Document   : successOrder
    Created on : Oct 23, 2023, 7:33:03 PM
    Author     : hoang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Done</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <!-- Favicon -->


    <!-- Google Web Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500;600;700;800&display=swap"
        rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Playpen+Sans:wght@800&display=swap" rel="stylesheet">
     <link rel="stylesheet" href="./assets/css/homePage.css">
    <!-- Libraries Stylesheet -->


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

    <!-- Template Stylesheet -->
    <link href="./assets/css/successOrder.css" rel="stylesheet">
</head>

<body>
    <!-- header -->
     <jsp:include page="/components/header.jsp"></jsp:include>
    <!-- close header -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
    <!-- Service Start -->

    <div class="container-fluid bg-light my-5 py-6 vh-100 mt-5" id="service">
        <div class="container">
            <div>
                <div class="row g-5 mb-5 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="col-lg-12">
                        <h2 class="display-5 mb-0"
                            style="font-weight: 450;font-family: 'Playpen Sans', cursive; color: rgb(13,103,128);"><i
                                class="fa-regular fa-circle-check fa-xl"></i> Thank you for using the service</h2>

                    </div>

                </div>
                <div class="row g-4">
                    <div class=" wow fadeInUp">
                        <div class="service-item d-flex flex-column flex-sm-row bg-white rounded h-100 p-4 p-lg-5">
                            <div class="bg-icon flex-shrink-0 mb-3">
                                <i class="fa-regular fa-id-badge fa-2xl" style="color: #ffffff;"></i>
                            </div>
                            <div class="ms-sm-4">
                                <h4 class="mb-3" style="font-family: 'Playpen Sans', cursive;">Your order number <span
                                        style="color: red;font-family: 'Playpen Sans', cursive;">O1235</span></h4>
                                <h6 class="mb-3" style="font-family: 'Playpen Sans', cursive;">
                                    We are preparing your birds    
                                </h6>
                                <span style="font-weight: 450;font-family: 'Playpen Sans', cursive;">You can view order
                                    details <a class="text-decoration-none" href="#"
                                        style="color: rgb(13,103,128);font-family: 'Playpen Sans', cursive;">HERE</a></span>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="row g-3 mt-3">
                    <a href="#" class="btn btn-primary btn-lg " style="background-color:rgb(13,103,128) ;font-family: 'Playpen Sans', cursive;" role="button" >Buy another product now</a>
                </div>
                
            </div>


        </div>
    </div>
    <!-- Service End -->


</body>
<script src="https://kit.fontawesome.com/46d5dcf0b7.js" crossorigin="anonymous"></script>



<jsp:include page="/components/footer.jsp"></jsp:include>
</html>
