

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <link rel="stylesheet" href="./assets/css/homePage.css">
        <link rel="stylesheet" href="./assets/css/singleProduct.css">
    </head>
    <body>
        <jsp:include page="/components/header.jsp"></jsp:include>
            <!-- image and detail-->
        <c:set var="bird_current" value="${sessionScope.BIRD_CURRENT}"></c:set>
        <c:set var="bird_same_name" value="${sessionScope.BIRD_SAME_NAME}"></c:set>

        <c:if test="${not empty bird_current}">
            <section class="py-5">
                <form method="product" id="myForm" class="container" method="get">
                      <div class="row gx-5">
                        <aside class="col-lg-6">
                            <div class="border rounded-4 mb-3 d-flex justify-content-center">
                                <a data-fslightbox="mygalley" class="rounded-4" target="_blank" data-type="image"
                                   href="${bird_current.image}">
                                    <img style="max-width: 100%; max-height: 100vh; margin: auto;" class="rounded-2 fit"
                                         src="${bird_current.image}" />
                                </a>
                            </div>
                        </aside>
                        <main class="col-lg-6">
                            <div class="ps-lg-3">
                                <h2 class="title text-dark">${bird_current.bird_Name}</h2>
                                <input type="hidden" name="txtBirdName" value="${bird_current.bird_Name}"/>

                                <div class="d-flex flex-row my-3">
                                    <div class="text-warning mb-1 me-2">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fas fa-star-half-alt"></i>
                                        <span class="ms-1">
                                            4.5
                                        </span>
                                    </div>
                                    <span class="text-muted"><i class="fa-solid fa-cart-shopping"></i>154 orders</span>
                                    <span class="text-success ms-2">Available</span>
                                </div>

                                <div class="mb-3">
                                    <span class="h5" style="color:#0D6780">${bird_current.priceFormat}</span>
                                    <span class="text-muted">/for a bird</span>
                                </div>

                                <p>
                                    ${bird_current.detail}
                                </p>

                                <div class="row">
                                    <dt class="col-3">Color</dt>
                                    <dd class="col-9">${bird_current.color}</dd>

                                    <dt class="col-3">Characteristic</dt>
                                    <dd class="col-9">${bird_current.characteristics}</dd>
                                </div>

                                <hr />
                                <jsp:useBean id="util" class="Utils.FuncHelper"></jsp:useBean>
                                    <div class="row mb-4">
                                        <div class="col-md-4 col-6">
                                            <label class="mb-2">Age</label>
                                            <select name="txtAge" onchange="submit()" class="form-select border border-secondary" style="height: 35px;">

                                            <c:set var="age_list" value="${requestScope.AGE_LIST}"></c:set>
                                            <option ${util.checkExist(age_list, 'Baby') ? '' : 'disabled'} ${bird_current.age == 'Baby' ? 'selected' : ''}>
                                                Baby
                                            </option>
                                            <option ${util.checkExist(age_list, 'Young') ? '' : 'disabled'} ${bird_current.age == 'Young' ? 'selected' : ''}>
                                                Young
                                            </option>
                                            <option ${util.checkExist(age_list, 'Mature') ? '' : 'disabled'} ${bird_current.age == 'Mature' ? 'selected' : ''}>
                                                Mature
                                            </option>
                                            <option ${util.checkExist(age_list, 'Adult') ? '' : 'disabled'} ${bird_current.age == 'Adult' ? 'selected' : ''}>
                                                Adult
                                            </option>
                                        </select>
                                    </div>
                                    <div class="col-md-4 col-6">
                                        <label class="mb-2">Gender</label>
                                        <select name="txtGender" onchange="submit()" class="form-select border border-secondary" style="height: 35px;">
                                            <c:set var="gender_list" value="${requestScope.GENDER_LIST}"></c:set>
                                            <option ${util.checkExist(gender_list, 'Male') ? '' : 'disabled'} ${bird_current.gender == 'Male' ? 'selected' : ''}>
                                                Male
                                            </option>
                                            <option ${util.checkExist(gender_list, 'Female') ? '' : 'disabled'} ${bird_current.gender == 'Female' ? 'selected' : ''}>
                                                Female
                                            </option>
                                        </select>
                                    </div>

                                    <div class="col-md-4 col-6 mb-3">
                                        <label class="mb-2 d-block">Quantity</label>
                                        <div class="input-group mb-3" style="width: 170px;">
                                            <button name="btn" value="des" class="btn btn-link px-2 text-muted"
                                                    onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                                <i class="fas fa-minus"></i>
                                            </button>
                                            <input id="form1" name="txtQuantityBuy" value="" type="number"
                                                   class="form-control form-control-sm button-input"x   />
                                            <input name="txtBirdID" value="${key}" type="hidden" />
                                            <input name="txtQuantityAvailable" value="" type="hidden" />
                                            <button name="btn" value="inc" class="btn btn-link px-2 text-muted"
                                                    onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                                <i class="fas fa-plus"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <!-- Buying -->
                                <a href="#" class="btn btn-danger shadow-0 text-white"> Buy now </a>
                                <div class="Addtocart">
                                    <i class="fa-solid fa-cart-shopping"></i>
                                    <input  type="submit" value="Add to cart">

                                </div>
                                <a href="#" class="btn btn-light border border-secondary py-2 icon-hover px-3"> <i
                                        class="me-1 fa fa-heart fa-lg"></i> Save </a>
                            </div>
                        </main>
                    </div>
                </form>
            </section>
        </c:if>


        <!-- Spe and feedback navs -->
        <section class="bg-light border-top py-4">
            <div class="container">
                <div class="row gx-4">
                    <div class="col-lg-8 mb-4">
                        <div class="border rounded-2 px-3 py-2 bg-white">
                            <nav>
                                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                    <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab"
                                            data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home"
                                            aria-selected="true">Specification</button>
                                    <button class="nav-link" id="nav-comment-tab" data-bs-toggle="tab"
                                            data-bs-target="#nav-comment" type="button" role="tab" aria-controls="nav-comment"
                                            aria-selected="false">Feedback</button>
                                </div>
                            </nav>

                            <!-- Spe and feedback content -->
                            <!-- spe -->
                            <div class="tab-content" id="nav-tabContent">
                                <div class="tab-pane fade show active" id="nav-home" role="tabpanel"
                                     aria-labelledby="nav-home-tab">
                                    <div style="display: flex; flex-direction:column; padding-top: 2%; padding-left: 2%;">
                                        <div class="ProductTitleInformation">
                                            <div class="ProductTitleInformationFormore"
                                                 style="display: grid; grid-template-columns: 55% 45%; gap: 4px;">
                                                <span style="max-width: 300px; color: rgb(128,128,137);">
                                                    Species
                                                </span>
                                                <span class="ProductAtribute">
                                                    <p>Parrot</p>
                                                </span>
                                                <span style="max-width: 300px; color: rgb(128,128,137);">
                                                    Origin
                                                </span>
                                                <span class="ProductAtribute">
                                                    <p>Eastern Autralia</p>
                                                </span>
                                                <span style="max-width: 300px; color: rgb(128,128,137);">
                                                    Color
                                                </span>
                                                <span class="ProductAtribute">
                                                    <p>Yellow, green</p>
                                                </span>
                                                <span style="max-width: 300px; color: rgb(128,128,137);">
                                                    Characterristic
                                                </span>
                                                <span class="ProductAtribute">
                                                    <p>Quite</p>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- feedback Comment -->
                                <div class="tab-pane fade" id="nav-comment" role="tabpanel"
                                     aria-labelledby="nav-comment-tab">
                                    <div class="row">

                                        <div class="col-10">

                                            <div class="comment-card" style="padding-top: 20px">
                                                <div class="comment-card-body">
                                                    <div class="row">
                                                        <div class="col-md-2">
                                                            <img src="https://thumbs.dreamstime.com/b/default-avatar-profile-image-vector-social-media-user-icon-potrait-182347582.jpg"
                                                                 class="img img-rounded img-fluid" />
                                                            <p class="text-secondary text-center" style="font-size:12px">15
                                                                Minutes Ago</p>
                                                        </div>
                                                        <div class="col-md-10 user-comment">
                                                            <p>
                                                                <a class="float-left" href=""
                                                                   style="text-decoration: none; color:#0D6780"><strong>Truong
                                                                        Tuyet Ngan (K17 HCM)</strong></a>
                                                                <span class="float-right"><i
                                                                        class="text-warning fa fa-star"></i></span>
                                                                <span class="float-right"><i
                                                                        class="text-warning fa fa-star"></i></span>
                                                                <span class="float-right"><i
                                                                        class="text-warning fa fa-star"></i></span>
                                                                <span class="float-right"><i
                                                                        class="text-warning fa fa-star"></i></span>

                                                            </p>
                                                            <div class="clearfix"></div>
                                                            <p>I got the bird. Its very beautiful!
                                                            </p>

                                                            <a class="float-right btn btn-outline-primary ml-2"> <i
                                                                    class="fa fa-reply"></i> Reply</a>
                                                            <a class="float-right btn like text-white btn-danger"> <i
                                                                    class="fa fa-heart"></i> Like</a>
                                                            </p>
                                                        </div>
                                                    </div>
                                                    <div class="comment-card comment-card-inner user-comment-reply">
                                                        <div class="comment-card-body">
                                                            <div class="row">
                                                                <div class="col-md-2">
                                                                    <img src="https://thumbs.dreamstime.com/b/default-avatar-profile-image-vector-social-media-user-icon-potrait-182347582.jpg"
                                                                         class="img img-rounded img-fluid" />
                                                                    <p class="text-secondary text-center"
                                                                       style="font-size:12px">15 Minutes Ago</p>
                                                                </div>
                                                                <div class="col-md-10">
                                                                    <p><a href=""
                                                                          style="text-decoration: none; color:#0D6780"><strong>Tran
                                                                                Manh Cuong (K17 HCM)</strong></a></p>

                                                                    <p>I just got the bird too, it's so fantastic!</p>
                                                                    <a class="float-right btn btn-outline-primary ml-2">
                                                                        <i class="fa fa-reply"></i> Reply</a>
                                                                    <a class="float-right btn like text-white btn-danger">
                                                                        <i class="fa fa-heart"></i> Like</a>
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Similar item -->
                    <div class="col-lg-4">
                        <div class="px-0 border rounded-2 shadow-0">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Similar items</h5>
                                    <div class="d-flex mb-3">
                                        <a href="#" class="me-3">
                                            <img src="https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B5.jpg"
                                                 style="width: 96px; height: 96px;" class="img-md img-thumbnail" />
                                        </a>
                                        <div class="info">
                                            <a href="#" class="nav-link mb-1">Fuetes's parrot </a>
                                            <strong style="color:#0D6780"> $710</strong>
                                        </div>
                                    </div>

                                    <div class="d-flex mb-3">
                                        <a href="#" class="me-3">
                                            <img src="https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B9.jpg"
                                                 style="width: 96px; height: 96px;" class="img-md img-thumbnail" />
                                        </a>
                                        <div class="info">
                                            <a href="#" class="nav-link mb-1">Red-and-green macaw</a>
                                            <strong style="color:#0D6780"> $130</strong>
                                        </div>
                                    </div>

                                    <div class="d-flex mb-3">
                                        <a href="#" class="me-3">
                                            <img src="https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B15.jpg"
                                                 style="width: 96px; height: 96px;" class="img-md img-thumbnail" />
                                        </a>
                                        <div class="info">
                                            <a href="#" class="nav-link mb-1">Hyacinth macaw</a>
                                            <strong style="color:#0D6780"> $480</strong>
                                        </div>
                                    </div>

                                    <div class="d-flex">
                                        <a href="#" class="me-3">
                                            <img src="https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B17.jpg"
                                                 style="width: 96px; height: 96px;" class="img-md img-thumbnail" />
                                        </a>
                                        <div class="info">
                                            <a href="#" class="nav-link mb-1">Blue-throated macaw</a>
                                            <strong style="color:#0D6780"> $500</strong>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <jsp:include page="/components/footer.jsp"></jsp:include>
        <script>
                                            function submit()
                                            {
                                                document.querySelector(".myForm").onsubmit();
                                            }
        </script>
    </body>
</html>
