<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup</title>
    <link rel="stylesheet" href="CSS\login.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

</head>

<body>
    <div class="login">
        <h1 class="login-heading">Login</h1>
        <button class="login-social">
            <!-- <i class="fa fa-google signup-social-icon"></i> -->
            <!-- <i class="fa-brands fa-google"></i> -->

            <span class="login-social-text">
                <a class="text-decoration-none text-white " href="#">Login with Google</a>
            </span>
        </button>
        <button class="login-social-fb ">
            <!-- <i class="fa fa-google signup-social-icon"></i> -->


            <span class="login-social-text">
                <a class="text-decoration-none text-white " href="#">Login with Facebook</a>
            </span>
        </button>
        <div class="login-or">
            <span>Or</span>
        </div>
        
        <from action=# class="login-form" autocomplete="off">
            <!-- <label for="fullname" class="signup-label">Full name</label>
            <input type="text" id="fullname" class="signup-input" placeholder="Eg: Nguyen Van A"> -->

            <label for="email" class="login-label">Email Address</label>
            <input type="email" id="email" class="login-input" placeholder="example@gmail.com">

            <label for="password" class="login-label">Password</label>
            <input type="password" class="login-input-pass" placeholder="Eg: 123">

            <div class="check-forget">
                <div class="col-md-6">
                    <div class="checkbox-1">
                        <input type="checkbox" class="login-remember" value="remember" > Remember me ?
                    </div>
                </div>

                <div class="col-md-6">
                    <p class="login-forgetpassword">
                        <a href="forgetpass.html" class="login-forgetpassword-link">Forget password ?</a>
                    </p>
                </div>
            </div>
            <button class="login-submit">Login</button>
        </from>


        <p class="login-already">
            <span>Haven't a account ?</span>
            <a href="register.html" class="signup-login-link">Register</a>
        </p>
    </div>
    </div>

</body>

</html>