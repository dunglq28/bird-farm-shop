<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup</title>
    <link rel="stylesheet" href="/assets/css/forgetpass.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

</head>

<body>
    <div class="retrieval">
        <h1 class="retrieval-heading">Password retrieval</h1>
        <from action=# class="retrieval-form" autocomplete="off">
            <label for="fullname" class="retrieval-label">Enter your full name</label>
            <input type="text" id="fullname" class="password-input" placeholder="Eg: Nguyen Van A">

            <label for="email" class="retrieval-label">Enter your Email Address</label>
            <input type="email" id="email" class="password-input" placeholder="example@gmail.com">

            <label for="verification" class="retrieval-label">Verification codes</label>
            <div class="password-form-vertify">
            
           

                <input type="text" class="password-input" placeholder="Enter verification codes">
                <button class="retrieval-form-getcode">Send</button>
            </div>



            
        </from>

        <label for="password" class="retrieval-label">Enter new password</label>
        <input type="password" class="password-input" placeholder="Eg: 123">

        <label for="password" class="retrieval-label">Confirm your password</label>
        <input type="password" class="password-input" placeholder="Eg: 123">

        <button class="password-submit">Create new password</button>
    </div>
    </div>

</body>

</html>