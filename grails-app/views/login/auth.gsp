<!DOCTYPE html>
<html lang="en">

<head>
    <meta name="layout" content="ems">
    <title>Login</title>
</head>

<body>

<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="login-panel panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Please Sign In</h3>
                </div>
                <div class="panel-body">
                    <form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
                        <fieldset>
                            <div class="form-group">
                                <input type='text' class='text_ form-control' placeholder="username" name='j_username' id='username'/>
                            </div>
                            <div class="form-group">
                                <input type='password' class='text_ form-control' placeholder="password" name='j_password' id='password'/>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>Remember Me
                                </label>
                            </div>
                            <!-- Change this to a button or input when using this as a form -->
                            <input type='submit' id="submit" value='Login'/>
                        </fieldset>
                    <form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

</html>
