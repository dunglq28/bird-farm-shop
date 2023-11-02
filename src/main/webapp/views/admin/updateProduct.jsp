
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

    <head>
        <!-- Basic -->
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <!-- Site Metas -->
        <title> Update product </title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <!-- bootstrap core css -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" />
        <link href="./assets/css/createProduct.css" rel="stylesheet" />
        <!--<link rel="stylesheet" href="./assets/css/dashboard.css" />-->
    </head>

    <body class="sub_page">

        <!-- book section -->
        <form action="" class="book_section layout_padding" method="POST" enctype="multipart/form-data">
            <div class="container">
                <h1 class="">Update product</h1>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form_container">
                            <jsp:useBean id="util" class="Utils.FormatCurrency"></jsp:useBean>
                            <c:set var="pro" value="${requestScope.PRODUCT_UPDATE}"></c:set>
                                <select name="productTypeID" onchange="submit()" class="form-control-select nice-select wide" required>
                                    <option value="" disabled selected>
                                        Product Type
                                    </option>
                                    <option ${pro.product_TypeID == '1' ? 'selected' : ''} value="1">
                                    Bird
                                </option>
                                <option ${pro.product_TypeID == '2' ? 'selected' : ''} value="2">
                                    Bird Nest
                                </option>
                            </select>
                            <select name="cateID" class="form-control-select nice-select wide" required>
                                <option value="" disabled selected>
                                    Category name
                                </option>
                                <c:forEach items="${requestScope.CATE_LIST}" var="cateList">
                                    <option ${pro.categoryID == cateList.categoryID ? 'selected' : ''}
                                        value="${cateList.categoryID}">${cateList.category_Name}</option>
                                </c:forEach>
                            </select>
                            <div>
                                <input name="nameBird" value="${pro.product_Name}" type="text" class="form-control" placeholder="Name" required/>
                            </div>

                            <div>
                                <input name="Quantity" value="${pro.quantity_Available}" type="number" class="form-control" placeholder="Quantity " required/>
                                <c:if test="${not empty requestScope.ERROR_QTY_AVAI}">
                                    <h6 style="margin: -22px 0 22px 0; color: red">${requestScope.ERROR_QTY_AVAI}</h6>
                                </c:if>                           
                            </div>
                            <div>
                                <input name="Price" value="${util.FormatPrice(pro.price)}" type="text" class="form-control" placeholder="Price" required/>
                                <c:if test="${not empty requestScope.ERROR_PRICE}">
                                    <h6 style="margin: -22px 0 22px 0; color: red">${requestScope.ERROR_PRICE}</h6>
                                </c:if>                            
                            </div>
                            <div>
                                <input name="Discount" value="${util.FormatDiscount(pro.discount)}" type="number" class="form-control" placeholder="Discount" required/>
                                <c:if test="${not empty requestScope.ERROR_DISCOUNT}">
                                    <h6 style="margin: -22px 0 22px 0; color: red">${requestScope.ERROR_DISCOUNT}</h6>
                                </c:if>                            
                            </div>
                            <div class="form-control-upload" style="border: none;" >
                                <div>
                                    <div class="d-flex align-content-center text-center">
                                        <p><input type="file" name="file" required onchange="showImage(this);" /></p>
                                        <p><img id="preview" src="" alt="Photo" style="max-height: 100px;" /></p>
                                    </div>
                                </div>
                            </div>
                            <div class="row justify-content-center align-content-center">
                                <h6 class="mb-0 col-md-2">
                                    <a href="viewAllProduct" class="text-body">
                                        <i class="fas fa-long-arrow-alt-left me-2"></i>Back
                                    </a>
                                </h6>
                                <div class="btn_box col-md-10">
                                    <button name="btAction" value="Create" type="submit" class="btn btn-primary"  style="background: rgb(13,103,128); border: none;">
                                        Update now
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form_container">
                            <div>
                                <c:if test="${requestScope.PRODUCT_TYPE == '2'}">
                                    <div>
                                        <select name="dadBirdID" class="form-control-select nice-select wide" required>
                                            <option value="" disabled selected >
                                                Dad bird ID
                                            </option>
                                            <c:forEach items="${requestScope.MALE_BIRD_LIST}" var="maleList">
                                                <option ${pro.dad_Bird_ID == maleList.productID ? 'selected' : ''}>
                                                    ${maleList.productID}
                                                </option>
                                            </c:forEach>

                                        </select>
                                        <select name="momBirdID" class="form-control-select nice-select wide" required>
                                            <option value="" disabled selected>
                                                Mom bird ID
                                            </option>
                                            <c:forEach items="${requestScope.FEMALE_BIRD_LIST}" var="femaleList">
                                                <option  ${pro.mom_Bird_ID == femaleList.productID ? 'selected' : ''}>
                                                    ${femaleList.productID}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div>
                                        <input name="qtyMaleBaby" value="${pro.quantity_MaleBird}" type="number" class="form-control" placeholder="Quantity male babybird" required/>
                                        <c:if test="${not empty requestScope.ERROR_QTY_MBAY}">
                                            <h6 style="margin: -22px 0 22px 0; color: red">${requestScope.ERROR_QTY_MBAY}</h6>
                                        </c:if>
                                    </div>
                                    <div>
                                        <input name="qtyFemaleBaby" value="${pro.quantity_FemaleBird}" type="number" class="form-control" placeholder="Quantity female babybird" required/>
                                        <c:if test="${not empty requestScope.ERROR_QTY_FMBABY}">
                                            <h6 style="margin: -22px 0 22px 0; color: red">${requestScope.ERROR_QTY_FMBABY}</h6>
                                        </c:if>                                    </div>
                                    </c:if>
                                    <c:if test="${requestScope.PRODUCT_TYPE == '1'}">
                                    <div>
                                        <select name="Gender" class="form-control-select nice-select wide" required> 
                                            <option value="" disabled selected>Gender</option>
                                            <option ${pro.gender == 'Male' ? 'selected' : ''}>Male</option>
                                            <option ${pro.gender == 'Female' ? 'selected' : ''}>Female</option>
                                        </select>
                                    </div>
                                    <div>
                                        <select name="Age" class="form-control-select nice-select wide" required>
                                            <option value="" disabled selected>Age</option>
                                            <option ${pro.age == 'Baby' ? 'selected' : ''}>Baby</option>
                                            <option ${pro.age == 'Young' ? 'selected' : ''}>Young</option>
                                            <option ${pro.age == 'Adult' ? 'selected' : ''}>Adult</option>
                                            <option ${pro.age == 'Mature' ? 'selected' : ''}>Mature</option>
                                        </select>
                                    </div>
                                    <div>
                                        <input name="Color" value="${pro.color}" type="text" class="form-control" placeholder="Color" required />
                                    </div>
                                </c:if>

                                <div>
                                    <input name="Characteristic" value="${pro.characteristics}" type="text" class="form-control" placeholder="Characteristic" required />
                                </div>
                                <div style="width: 100%; height: 100px;">
                                    <textarea name="Detail"   value="" class="form-control" placeholder="Detail" required style="width: 100%; height: 125%; overflow-wrap: break-word;">${pro.detail}</textarea>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <script>
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