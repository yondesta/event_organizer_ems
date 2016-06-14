<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="ems">
    <title>Register Participant</title>
</head>
<body>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Register Participant</h1>
    </div>
</div>
<g:if test="${flash.message}">
    <div class="alert ${flash.messageType ?: 'alert-info'} alert-dismissable" role="status">${flash.message}
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
    </div>
</g:if>
<g:hasErrors bean="${userInstance}">
    <ul class="alert alert-danger" role="alert">
        <g:eachError bean="${userInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>
<form action="${createLink(controller: 'registration', action: 'save')}" role="form">
    <g:render template="form"/>
    <fieldset class="buttons">
        <g:submitButton name="save" class="btn btn-default" value="Register"/>
    </fieldset>
</form>
</body>
</html>