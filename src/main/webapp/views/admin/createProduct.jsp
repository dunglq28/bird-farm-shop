<%-- 
    Document   : createProduct
    Created on : Nov 1, 2023, 10:40:20 AM
    Author     : hoang
--%>

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



</head>

<body class="sub_page">


  <!-- book section -->
  <form class="book_section layout_padding">
    <div class="container">
      <div class="heading_container">

      </div>
      <h1 class="mb-3">Create product</h1>
      <div class="row">
        <div class="col-md-6">
          <div class="form_container">
            <div>
              <input type="text" class="form-control" placeholder="Decription" />
            </div>
            <div class="form-control-upload" style="border: none;" >
              <form action="upload" method="post" enctype="multipart/form-data">
                <div class="d-flex align-content-center text-center">
                  <p><input type="file" name="file" required onchange="showImage(this);" /></p>
                  <p><img id="preview" src="" alt="Photo" style="max-height: 100px;" /></p>
                </div>

              </form>
            </div>
            <div>
              <input type="text" class="form-control" placeholder="Name" />
            </div>
            <div>

            </div>
            <select class="form-control-select nice-select wide">
              <option value="" disabled selected>
                Category name
              </option>
              <option value="">
                Parrot
              </option>
              <option value="">
                Macaw
              </option>
              <option value="">
                Pigeon
              </option>
              <option value="">
                Jenday Conure
              </option>
              <option value="">
                Parakeet
              </option>
              <option value="">
                Dove
              </option>
              <option value="">
                Conure
              </option>
              <option value="">
                Cockatiel
              </option>
              <option value="">
                Eclectus
              </option>
              <option value="">
                Finch
              </option>
              <option value="">
                Cockatoo
              </option>
              <option value="">
                Canary
              </option>
              <option value="">
                Toucan
              </option>
              <option value="">
                Caique
              </option>
              <option value="">
                Duck
              </option>
              <option value="">
                Amazon Parrot
              </option>
              <option value="">
                Goose
              </option>

            </select>

            <select class="form-control-select nice-select wide">
              <option value="" disabled selected>
                Type
              </option>
              <option value="">
                Bird
              </option>
              <option value="">
                ...
              </option>
              <option value="">
                ...
              </option>
            </select>
            <div>
              <input type="number" class="form-control" placeholder="Quantity " />
            </div>
            <div>
              <input type="text" class="form-control" placeholder="Price" />
            </div>
            <div>
              <input type="text" class="form-control" placeholder="Discount" />
            </div>
            <div class="btn_box">
              <button type="button" class="btn btn-primary"  style="background: rgb(13,103,128); border: none;">Create now</button>
            </div>


          </div>


        </div>

        <div class="col-md-6">
          <div class="form_container">
            <form action="">


              <div>


                <select class="form-control-select nice-select wide">
                  <option value="" disabled selected>
                    Dad bird ID
                  </option>
                  <option value="">
                    1
                  </option>
                </select>
                <select class="form-control-select nice-select wide">
                  <option value="" disabled selected>
                    Mom bird ID
                  </option>
                </select>
              </div>

              <div>
                <select class="form-control-select nice-select wide">
                  <option value="" disabled selected>
                    Gender
                  </option>
                  <option value="">
                    Male
                  </option>
                  <option value="">
                    Female
                  </option>
                </select>
              </div>
              <div>
                <select class="form-control-select nice-select wide">
                  <option value="" disabled selected>
                    Age
                  </option>
                  <option value="">
                    Tam Heo
                  </option>
                  <option value="">
                    Tam Lon
                  </option>
                </select>
              </div>
              <div>
                <input type="text" class="form-control" placeholder="Color" />
              </div>
              <div>
                <input type="text" class="form-control" placeholder="Characteristic" />
              </div>
              <div>
                <input type="text" class="form-control" placeholder="Detail " />
              </div>
              <div>
                <input type="text" class="form-control" placeholder="Quantity female bird" />
              </div>
              <div>
                <input type="text" class="form-control" placeholder="Quantity male bird" />
              </div>

            </form>
           
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