<%-- 
    Document   : singleProduct
    Created on : Sep 30, 2023, 4:02:19 PM
    Author     : tt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <!-- content -->
            <section class="py-5">
                <div class="container">
                    <div class="row gx-5">
                        <aside class="col-lg-6">
                            <div class="border rounded-4 mb-3 d-flex justify-content-center">
                                <a data-fslightbox="mygalley" class="rounded-4" target="_blank" data-type="image"
                                   href="https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B1.jpg">
                                    <img style="max-width: 100%; max-height: 100vh; margin: auto;" class="rounded-2 fit"
                                         src="https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B1.jpg" />
                                </a>
                            </div>
                            <!-- thumbs-wrap.// -->
                            <!-- gallery-wrap .end// -->
                        </aside>
                        <main class="col-lg-6">
                            <div class="ps-lg-3">
                                <h2 class="title text-dark">Turquoise parrot</h2>
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
                                    <span class="h5">$250</span>
                                    <span class="text-muted">/for a bird</span>
                                </div>

                                <p>
                                    Its wings are predominantly blue with red shoulders. The female is generally duller and
                                    paler,
                                    with a pale green breast and yellow belly, and lacks the red wing patch.
                                </p>

                                <div class="row">
                                    <dt class="col-3">Color</dt>
                                    <dd class="col-9">Yellow, Green</dd>

                                    <dt class="col-3">Characteristic</dt>
                                    <dd class="col-9">Quite</dd>
                                </div>

                                <hr />

                                <div class="row mb-4">
                                    <div class="col-md-4 col-6">
                                        <label class="mb-2">Age</label>
                                        <select class="form-select border border-secondary" style="height: 35px;">
                                            <option>Baby</option>
                                            <option>Young</option>
                                            <option>Mature</option>
                                            <option>Audult</option>
                                        </select>
                                    </div>
                                    <div class="col-md-4 col-6">
                                        <label class="mb-2">Gender</label>
                                        <select class="form-select border border-secondary" style="height: 35px;">
                                            <option>Male</option>
                                            <option>Female</option>
                                        </select>
                                    </div>

                                    <!-- col.// -->
                                    <div class="col-md-4 col-6 mb-3">
                                        <label class="mb-2 d-block">Quantity</label>
                                        <div class="input-group mb-3" style="width: 170px;">
                                            <button class="btn btn-white border border-secondary px-3" type="button"
                                                    id="button-addon1" data-mdb-ripple-color="dark">
                                                <i class="fas fa-minus"></i>
                                            </button>
                                            <input type="text" class="form-control text-center border border-secondary"
                                                   placeholder="14" aria-label="Example text with button addon"
                                                   aria-describedby="button-addon1" />
                                            <button class="btn btn-white border border-secondary px-3" type="button"
                                                    id="button-addon2" data-mdb-ripple-color="dark">
                                                <i class="fas fa-plus"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <a href="#" class="btn btn-danger shadow-0 text-white"> Buy now </a>
                                <a href="#" class="btn btn-primary shadow-0"> <i class="fa-solid fa-cart-shopping"></i> Add to
                                    cart </a>
                                <a href="#" class="btn btn-light border border-secondary py-2 icon-hover px-3"> <i
                                        class="me-1 fa fa-heart fa-lg"></i> Save </a>
                            </div>
                        </main>
                    </div>
                </div>
            </section>
            <!-- content -->

            <section class="bg-light border-top py-4">
                <div class="container">
                    <div class="row gx-4">
                        <div class="col-lg-8 mb-4">
                            <div class="border rounded-2 px-3 py-2 bg-white">
                                <!-- Pills navs -->
                                <nav>
                                    <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                        <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab"
                                                data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home"
                                                aria-selected="true">Specification</button>
                                        <button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab"
                                                data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact"
                                                aria-selected="false">Rating</button>
                                        <button class="nav-link" id="nav-comment-tab" data-bs-toggle="tab"
                                                data-bs-target="#nav-comment" type="button" role="tab" aria-controls="nav-comment"
                                                aria-selected="false">Feedback</button>
                                    </div>
                                </nav>
                                <!-- Pills navs -->

                                <!-- Pills content -->
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

                                    <div class="tab-pane fade" id="nav-contact" role="tabpanel"
                                         aria-labelledby="nav-contact-tab">
                                        <div class="card p-3">
                                            <div class="d-flex justify-content-between align-items-center">
                                                <div class="ratings">
                                                    <i class="fa fa-star rating-color"></i>
                                                    <i class="fa fa-star rating-color"></i>
                                                    <i class="fa fa-star rating-color"></i>
                                                    <i class="fa fa-star rating-color"></i>
                                                    <i class="fa fa-star rating-color"></i>
                                                </div>
                                                <h8 class="review-count" style="color: rgb(128,128,137);">Item rating</h8>
                                            </div>


                                            <div class="mt-2 d-flex justify-content-between align-items-center">
                                                <span style="max-width: 300px; color: rgb(128,128,137);">
                                                    Quality
                                                </span>
                                                <div class="small-ratings">
                                                    <i class="fa fa-star rating-color"></i>
                                                    <i class="fa fa-star rating-color"></i>
                                                    <i class="fa fa-star rating-color"></i>
                                                    <i class="fa fa-star rating-color"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>

                                            </div>

                                            <div class="mt-1 d-flex justify-content-between align-items-center">
                                                <span style="max-width: 300px; color: rgb(128,128,137);">
                                                    Variety
                                                </span>
                                                <div class="small-ratings">
                                                    <i class="fa fa-star rating-color"></i>
                                                    <i class="fa fa-star rating-color"></i>
                                                    <i class="fa fa-star rating-color"></i>
                                                    <i class="fa fa-star "></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                            </div>


                                            <div class="mt-1 d-flex justify-content-between align-items-center">
                                                <span style="max-width: 300px; color: rgb(128,128,137);">
                                                    Price
                                                </span>
                                                <div class="small-ratings">
                                                    <i class="fa fa-star rating-color"></i>
                                                    <i class="fa fa-star rating-color"></i>
                                                    <i class="fa fa-star rating-color"></i>
                                                    <i class="fa fa-star rating-color"></i>
                                                    <i class="fa fa-star rating-color"></i>
                                                </div>
                                            </div>


                                            <div class="mt-1 d-flex justify-content-between align-items-center">
                                                <span style="max-width: 300px; color: rgb(128,128,137);">
                                                    Warranty and return
                                                </span>
                                                <div class="small-ratings">
                                                    <i class="fa fa-star rating-color"></i>
                                                    <i class="fa fa-star rating-color"></i>
                                                    <i class="fa fa-star rating-color"></i>
                                                    <i class="fa fa-star rating-color"></i>
                                                    <i class="fa fa-star rating-color"></i>
                                                </div>
                                            </div>


                                            <div class="mt-1 d-flex justify-content-between align-items-center">
                                                <span style="max-width: 300px; color: rgb(128,128,137);">
                                                    Delivery fast
                                                </span>
                                                <div class="small-ratings">
                                                    <i class="fa fa-star rating-color"></i>
                                                    <i class="fa fa-star rating-color"></i>
                                                    <i class="fa fa-star rating-color"></i>
                                                    <i class="fa fa-star rating-color"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Comment -->
                                    <div class="tab-pane fade" id="nav-comment" role="tabpanel"
                                         aria-labelledby="nav-comment-tab">
                                        <div class="row">

                                            <div class="col-10">

                                                <div class="comment-box ml-2">

                                                    <div class="mt-1 d-flex justify-content-between align-items-center">
                                                        <span style="max-width: 300px; color: rgb(128,128,137); padding: 10px;">
                                                            Product quantity
                                                        </span>


                                                        <div class="rating">
                                                            <input type="radio" name="rating" value="5" id="5"><label
                                                                for="5">☆</label>
                                                            <input type="radio" name="rating" value="4" id="4"><label
                                                                for="4">☆</label>
                                                            <input type="radio" name="rating" value="3" id="3"><label
                                                                for="3">☆</label>
                                                            <input type="radio" name="rating" value="2" id="2"><label
                                                                for="2">☆</label>
                                                            <input type="radio" name="rating" value="1" id="1"><label
                                                                for="1">☆</label>
                                                        </div>


                                                    </div>




                                                    <div class="comment-area">

                                                        <textarea class="form-control" placeholder="Share your thought for us"
                                                                  rows="4"></textarea>

                                                    </div>

                                                    <div class="comment-btns mt-2">

                                                        <div class="row">

                                                            <div class="col-6">

                                                                <div class="pull-left">

                                                                    <button class="btn btn-light cancel btn-sm">Cancel</button>

                                                                </div>

                                                            </div>

                                                            <div class="col-6">

                                                                <div class="pull-right">

                                                                    <button class="btn btn-success send btn-sm">Submit</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Pills content -->
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
                                                <strong class="text-dark"> $710</strong>
                                            </div>
                                        </div>

                                        <div class="d-flex mb-3">
                                            <a href="#" class="me-3">
                                                <img src="https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B9.jpg"
                                                     style="width: 96px; height: 96px;" class="img-md img-thumbnail" />
                                            </a>
                                            <div class="info">
                                                <a href="#" class="nav-link mb-1">Red-and-green macaw</a>
                                                <strong class="text-dark"> $130</strong>
                                            </div>
                                        </div>

                                        <div class="d-flex mb-3">
                                            <a href="#" class="me-3">
                                                <img src="https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B15.jpg"
                                                     style="width: 96px; height: 96px;" class="img-md img-thumbnail" />
                                            </a>
                                            <div class="info">
                                                <a href="#" class="nav-link mb-1">Hyacinth macaw</a>
                                                <strong class="text-dark"> $480</strong>
                                            </div>
                                        </div>

                                        <div class="d-flex">
                                            <a href="#" class="me-3">
                                                <img src="https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B17.jpg"
                                                     style="width: 96px; height: 96px;" class="img-md img-thumbnail" />
                                            </a>
                                            <div class="info">
                                                <a href="#" class="nav-link mb-1">Blue-throated macaw</a>
                                                <strong class="text-dark"> $500</strong>
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
    </body>
</html>