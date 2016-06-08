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
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
</div>
<g:hasErrors bean="${userInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${userInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>
<form action="${createLink(action: 'saveRegistration')}" role="form">
    <g:render template="registrationForm"/>
    <fieldset class="buttons">
        <g:submitButton name="saveRegistration" class="save" value="${message(code: 'default.button.save.label', default: 'Register')}" />
    </fieldset>
</form>
<script type="application/javascript">
    $('#sendEmailCheckbox').on('change', function() {
       if($(this).is(':checked'))
           $('#sendEmail').val('true');
        else
           $('#sendEmail').val('false');
    });
</script>
</body>
</html>