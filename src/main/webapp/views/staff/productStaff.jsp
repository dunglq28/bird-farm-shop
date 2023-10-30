<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
        integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="./assets/css/dashboard.css" />
    <link rel="stylesheet" href="./assets/css/homePage.css">


    <title>My Order</title>

</head>

<body>
    <jsp:useBean id="util" class="Utils.FormatCurrency"></jsp:useBean>
    <jsp:include page="/components/siveBar.jsp"></jsp:include>
    
    <div class="main--content">
        <div class="header-wrapper">
            <div class="header--title">
                <span>Primary</span>
                <h2>Staff Management</h2>
            </div>
            <div class="user--info">
                <div class="search--box">
                    <i class="fa-solid fa-search"></i>
                    <input type="text" placeholder="search" />
                </div>
                ${sessionScope.ACCOUNT.fullName}
            </div>
        </div>
        <div class="tabular--wrapper">

            <div class="d-flex justify-content-between align-items-center mb-3">
                <div class="d-flex ">
                    <h1 class="fw-bold mb-0 text-black" style="color: #0D6780 !important;">Product<h6 class=" text-muted align-content-center mt-3">(6 product)</h6></h1>
                    
                </div>
                
                <div class="text-end "><button type="button" class="btn btn-primary" style="background: #0D6780; border: #0D6780;width: 50px; "><a href=""><i class="fa-solid fa-plus" style="color: white;"></i></i></a></button></div> 
            </div>
            
            

            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>ProductID</th>
                            <th>Product</th>
                            <th>Type</th>
                            <th>Origin price</th>
                            <th>Discount</th>
                            <th>Qty</th>
                            <th>Qty sale</th>
                            <!-- <th>Order date</th> -->
                            <th>Status</th>
                            <th>Option</th>
                        </tr>
                    </thead>
                    <tbody>
                        <div class="tbody-wrapper">


                            <tr>
                                <td>P01</td>
                                <td>
                                    
                                    <div class="d-flex justify-content-lg-start align-items-center">
                                        <div class="" style="max-width: 70px;">
                                              <img src="https://i.pinimg.com/564x/55/34/a1/5534a1e921d25dd9543d3c712fd44ad4.jpg" class="img-fluid rounded-3" alt="Bird Image">
                                        </div>


                                        <div class="" style="margin-left: 5px;">
                                           
                                            <h6 class="text-black">Blue parrot</h6>
                                            
                                        
            
                                            <div class="d-flex ">
                                                <h6 class=" ">Age: 1
                                                </h6>
                                                <h6 class="mb-0 text-sm-center " style="margin: 0 5px 0 5px;"> |
                                                </h6>
                                                <h6 class="">Gender: Female
                                                </h6>
                                            </div>
                                            <h6 class="">Color: Blue</h6>
                                            <!-- <h6 class="text-muted">Male baby bird:</h6>
                                            <h6 class="text-muted">Female baby bird:</h6> -->
                                        </div>
                                    </div> 
                                       
                                       
                                        
                                    
                                    
                                    </td>
                                <td>Bird</td>
                                <td>2.000.000</td>
                                <td>1.599.000</td>
                                <td>100</td>
                                <td>50</td>
                                <td><select class="form-control" id="exampleSelect">
                                    <option>Select</option>
                                    <option>Enable</option>
                                        <option>Disable</option>

                                    </select></td>


                                <td>
                                    <div class="d-flex">
                                        <h6 class="mb-0 text-sm-center text-muted" style="margin-right: 10px;">
                                            <a class="text-decoration-none text-muted" href=""><i
                                                    class="far fa-edit"></i> </a>
                                        </h6>
                                        <h6 class="mb-0 text-sm-center text-muted">
                                            <a class="text-decoration-none text-muted" href=""><i
                                                    class="fa-solid fa-delete-left"></i></i> </a>
                                        </h6>
                                    </div>

                                </td>
                            </tr>

                        </div>
                    </tbody>
                </table>
                <div class="col-12 mt-2">
                    <div class="pagination__option" style="text-align: center">
                        <a href=""><i class="fa-solid fa-plus"></i></i></a>
                       
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-12 text-center mt-2">
            <div class="pagination__option" style="text-align: end">
                <a href=""><i class="fa fa-angle-double-left"></i></a>
                <a href=""><i class="fa fa-angle-left"></i></a>
                <a href="#">${i}</a>
                <a href="#"><i class="fa fa-angle-right"></i></a>
                <a href="#"><i class="fa fa-angle-double-right"></i></a>
            </div>
        </div>
    </div>

    <script>
        function submit() {
            document.querySelector(".myForm").onsubmit();
            document.querySelector(".myOrder").onsubmit();
        }
    </script>
</body>

</html>