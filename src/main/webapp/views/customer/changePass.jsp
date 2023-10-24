<%-- 
    Document   : changePass
    Created on : Oct 24, 2023, 10:07:12 PM
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
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <h2 class="text-center" style="color: #0D6780;">Change password</h2>
                <form>
                    <div class="form-group">
                        <input type="text" class="form-control text-muted" id="name" value="Nguyễn Minh Tâm Péo" disabled>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control text-muted" id="oldPassword" placeholder="Enter old password">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control text-muted" id="newPassword" placeholder="Enter new password">
                    </div>
                    <!-- <div class="form-row align-items-center">
                        <div class="col">
                            <input type="text" class="form-control text-muted" id="confirmationCode"
                                placeholder="Nhập mã xác nhận">
                        </div>
                        <div class="col-auto">
                            <button type="button" class="btn btn-secondary" style="background: #0D6780;" id="getLinkButton">Get Link</button>
                        </div>
                    </div> -->
                    <div class="form-check mt-2">
                        <input type="checkbox" class="form-check-input" id="agreeCheck" >
                        <label class="form-check-label" for="agreeCheck">I agree to the terms and conditions</label>
                    </div>
                    <button type="submit" class="btn btn-primary mt-3" style="background: #0D6780;">Đổi Mật Khẩu</button>
                </form>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
