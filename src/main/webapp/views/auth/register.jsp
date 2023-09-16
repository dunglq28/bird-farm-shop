<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup</title>
    <link rel="stylesheet" href="/assets/css/register.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

</head>
<body>
    <div class="signup">
        <h1 class="signup-heading">Sign up</h1>
        <button class="signup-social">
            <!-- <i class="fa fa-google signup-social-icon"></i> -->
            <!-- <i class="fa-brands fa-google"></i> -->

            <span class="signup-social-text">
                <a class="text-decoration-none text-white " href="#">Sign up with Google</a>
            </span>
        </button>
        <button class="signup-social-fb">
            <!-- <i class="fa fa-google signup-social-icon"></i> -->


            <span class="signup-social-text">
                <a class="text-decoration-none text-white " href="#">Sign up with Facebook</a>
            </span>
        </button>
        <div class="signup-or">
            <span>Or</span>
        </div>

        <from action=# class="signup-form" autocomplete="off">
            <label for="fullname" class="signup-label">Full name</label>
            <input type="text" id="fullname" class="signup-input" placeholder="Eg: Nguyen Van A">

            <label for="email" class="signup-label">Email Address</label>
            <input type="email" id="email" class="signup-input" placeholder="example@gmail.com">

            

            <label for="verification" class="signup-label">Verification codes</label>
            <div class="signup-form-vertify">
                

                <input type="text" class="signup-input" placeholder="Enter verification codes">
                <button class="signup-form-getcode">Send</button>
            </div>

            <label for="password" class="signup-label">Password</label>
            <input type="password" class="signup-input" placeholder="Eg: 123">


            <button class="signup-submit">Sign up</button>
        </from>


        <p class="signup-already">
            <span>Already have a account ?</span>
            <a href="login.html" class="signup-login-link">Login</a>
        </p>
    </div>
    </div>

</body>

</html>