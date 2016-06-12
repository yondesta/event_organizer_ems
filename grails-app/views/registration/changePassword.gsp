<%--
  Created by IntelliJ IDEA.
  User: nicosalvato
  Date: 2016-06-11
  Time: 23:37
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="ems">
    <title>Change Password</title>
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
                    <form action='${createLink(controller: 'registration', action: 'updatePassword')}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
                        <fieldset>
                            <div class="form-group">
                                <input type='password' class='form-control' placeholder="Old Password" name='oldPassword' id='oldPassword'/>
                            </div>
                            <div class="form-group">
                                <input type='password' class='form-control' placeholder="New Password" name='newPassword' id='newPassword'/>
                            </div>
                            <div class="form-group">
                                <input type='password' class='form-control' placeholder="Confirm New Password" name='confirmNewPassword' id='confirmNewPassword'/>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>Remember Me
                                </label>
                            </div>
                            <!-- Change this to a button or input when using this as a form -->
                            <input class="btn btn-primary" type='submit' id="submit" value='Login'/>
                        </fieldset>
                        <g:hiddenField name="user.id" value="${user.id}"/>
                        <g:hiddenField name="event.id" value="${event.id}"/>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>