<%-- 
    Document   : customerInfor
    Created on : Oct 24, 2023, 11:37:03 PM
    Author     : hoang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Change password</title>

    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>

    </style>
</head>

<body>
    <section class="vh-100" style="background-color: #f4f5f7;">
        <div class="container py-5 h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col col-lg-12 mb-4 mb-lg-0">
                    <div class="card mb-3" style="border-radius: .5rem;">
                        <div class="row g-0">
                            <div class="col-md-4 gradient-custom text-center text-white"
                                style="border-top-left-radius: .5rem; border-bottom-left-radius: .5rem; background-color: #0D6780;">
                                <img src="https://i.pinimg.com/564x/3b/94/6e/3b946eb954f03a7eb2bbe6bfa02a22be.jpg"
                                    alt="Avatar" class="img-fluid my-5 rounded-circle" style="width: 80px;" />

                                <h5 contenteditable="true" id="editableText">Hoàng Trung Lưu</h5>
                                <p>Customer</p>
                                <i class="far fa-edit mb-5"></i>
                            </div>
                            <div class="col-md-8">
                                <div class="card-body p-4">
                                    <h3 style="color: #0D6780;">Information <i class="far fa-edit "></i></h3>
                                    <hr class="mt-0 mb-4">
                                    <div class="row pt-1">
                                        <div class="col-6 mb-3">
                                            <h6>Email <i class="far fa-edit"></i></h6>
                                            <p class="text-muted" contenteditable="true" id="editableText">
                                                Luuhtse171875@fpt.edu.vn</p>

                                        </div>
                                        <div class="col-6 mb-3">
                                            <h6>Phone <i class="far fa-edit"></i></h6>
                                            <p class="text-muted" contenteditable="true" id="editableText">0123456789
                                            </p>

                                        </div>
                                    </div>

                                    <hr class="mt-0 mb-4">
                                    <div class="row pt-1">
                                        <div class="col-6 mb-3">
                                            <h6>Sex <i class="far fa-edit"></i></h6>
                                            <p class="text-muted" contenteditable="true" id="editableText">Male</p>
                                        </div>
                                        <div class="col-6 mb-3">
                                            <h6>Date of birth <i class="far fa-edit"></i></h6>
                                            <p class="text-muted" contenteditable="true" id="editableText">26/11/2003
                                            </p>
                                        </div>
                                    </div>
                                    <div class="d-flex justify-content-end">
                                        <button type="button" class="btn btn-primary"
                                            style="width: 65px; background-color: #0D6780 ; border: #0D6780;"><i
                                                class="fa-solid fa-check fa-lq"></i></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script src="https://kit.fontawesome.com/46d5dcf0b7.js" crossorigin="anonymous"></script>
</body>