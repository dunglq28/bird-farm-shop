
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
        <title> Create product </title>
        <!-- bootstrap core css -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" />
        <link href="./assets/css/createProduct.css" rel="stylesheet" />
        <!--<link rel="stylesheet" href="./assets/css/dashboard.css" />-->
    </head>

    <body class="sub_page">

        <!-- book section -->

        <form action="createProduct" class="book_section layout_padding" method="POST" enctype="multipart/form-data">
            <div class="container">
                <h1 class="">Create product</h1>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form_container">
                            <select name="productTypeID" onchange="submit()" class="form-control-select nice-select wide" required>
                                <option value="" disabled selected>
                                    Product Type
                                </option>
                                <option ${requestScope.PRODUCT_TYPE == '1' ? 'selected' : ''} value="1">
                                    Bird
                                </option>
                                <option ${requestScope.PRODUCT_TYPE == '2' ? 'selected' : ''} value="2">
                                    Bird Nest
                                </option>
                            </select>
                            <select name="cateID" onchange="submit()" class="form-control-select nice-select wide" required>
                                <option value="" disabled selected>
                                    Category name
                                </option>
                                <c:forEach items="${requestScope.CATE_LIST}" var="cateList">
                                    <option ${requestScope.CATE_CHOOSE == cateList.categoryID ? 'selected' : ''}
                                        value="${cateList.categoryID}">${cateList.category_Name}</option>
                                </c:forEach>
                            </select>
                            <div>
                                <input name="nameBird" value="${param.nameBird}" type="text" class="form-control" placeholder="Name" required/>
                            </div>

                            <div>
                                <input name="Quantity" value="${param.Quantity}" type="number" class="form-control" placeholder="Quantity " required/>
                                <c:if test="${not empty requestScope.ERROR_QTY_AVAI}">
                                    <h6 style="margin: -22px 0 22px 0; color: red">${requestScope.ERROR_QTY_AVAI}</h6>
                                </c:if>                           
                            </div>
                            <div>
                                <input name="Price" value="${param.Price}" type="number" class="form-control" placeholder="Price" required/>
                                <c:if test="${not empty requestScope.ERROR_PRICE}">
                                    <h6 style="margin: -22px 0 22px 0; color: red">${requestScope.ERROR_PRICE}</h6>
                                </c:if>                            
                            </div>
                            <div>
                                <input name="Discount" value="${param.Discount}" type="number" class="form-control" placeholder="Discount" required/>
                                <c:if test="${not empty requestScope.ERROR_DISCOUNT}">
                                    <h6 style="margin: -22px 0 22px 0; color: red">${requestScope.ERROR_DISCOUNT}</h6>
                                </c:if>                            
                            </div>
                            <div>
                                <input type="text" class="form-control" placeholder="Decription" />
                            </div>
                            <div class="form-control-upload" style="border: none;" >
                                <div>
                                    <div class="d-flex align-content-center text-center">
                                        <p><input type="file" name="file" required onchange="showImage(this);" /></p>
                                        <p><img id="preview" src="" alt="Photo" style="max-height: 100px;" /></p>
                                    </div>
                                </div>
                            </div>
                            <div class="btn_box">
                                <button name="btAction" value="Create" type="submit" class="btn btn-primary"  style="background: rgb(13,103,128); border: none;">
                                    Create now
                                </button>
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
                                                <option ${param.dadBirdID == maleList.productID ? 'selected' : ''}>
                                                    ${maleList.productID}
                                                </option>
                                            </c:forEach>

                                        </select>
                                        <select name="momBirdID" class="form-control-select nice-select wide" required>
                                            <option value="" disabled selected>
                                                Mom bird ID
                                            </option>
                                            <c:forEach items="${requestScope.FEMALE_BIRD_LIST}" var="femaleList">
                                                <option  ${param.momBirdID == femaleList.productID ? 'selected' : ''}>
                                                    ${femaleList.productID}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div>
                                        <input name="qtyMaleBaby" value="${param.qtyMaleBaby}" type="number" class="form-control" placeholder="Quantity male babybird" required/>
                                        <c:if test="${not empty requestScope.ERROR_QTY_MBAY}">
                                            <h6 style="margin: -22px 0 22px 0; color: red">${requestScope.ERROR_QTY_MBAY}</h6>
                                        </c:if>
                                    </div>
                                    <div>
                                        <input name="qtyFemaleBaby" value="${param.qtyFemaleBaby}" type="number" class="form-control" placeholder="Quantity female babybird" required/>
                                        <c:if test="${not empty requestScope.ERROR_QTY_FMBABY}">
                                            <h6 style="margin: -22px 0 22px 0; color: red">${requestScope.ERROR_QTY_FMBABY}</h6>
                                        </c:if>                                    </div>
                                    </c:if>
                                    <c:if test="${requestScope.PRODUCT_TYPE == '1'}">
                                    <div>
                                        <select name="Gender" class="form-control-select nice-select wide" required> 
                                            <option value="" disabled selected>Gender</option>
                                            <option ${param.Gender == 'Male' ? 'selected' : ''}>Male</option>
                                            <option ${param.Gender == 'Female' ? 'selected' : ''}>Female</option>
                                        </select>
                                    </div>
                                    <div>
                                        <select name="Age" class="form-control-select nice-select wide" required>
                                            <option value="" disabled selected>Age</option>
                                            <option ${param.Age == 'Baby' ? 'selected' : ''}>Baby</option>
                                            <option ${param.Age == 'Young' ? 'selected' : ''}>Young</option>
                                            <option ${param.Age == 'Adult' ? 'selected' : ''}>Adult</option>
                                            <option ${param.Age == 'Mature' ? 'selected' : ''}>Mature</option>
                                        </select>
                                    </div>
                                    <div>
                                        <input name="Color" value="${param.Color}" type="text" class="form-control" placeholder="Color" required />
                                    </div>
                                </c:if>

                                <div>
                                    <input name="Characteristic" value="${param.Characteristic}" type="text" class="form-control" placeholder="Characteristic" required />
                                </div>
                                <div style="width: 100%; height: 100px;">
                                    <textarea name="Detail" class="form-control" placeholder="Detail" required style="width: 100%; height: 100%; overflow-wrap: break-word;"></textarea>
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