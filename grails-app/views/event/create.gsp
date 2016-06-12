<%@ page import="org.springframework.validation.FieldError" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="ems">
		<title>Create New Event</title>
	</head>
	<body>
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Create New Event</h1>
			</div>
		</div>
		<g:if test="${flash.message}">
			<div class="alert ${flash.messageType ?: 'alert-info'} alert-dismissable" role="status">${flash.message}
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
			</div>
		</g:if>
		<g:hasErrors bean="${eventInstance}">
		<ul class="errors" role="alert">
			<g:eachError bean="${eventInstance}" var="error">
			<li <g:if test="${error in FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
			</g:eachError>
		</ul>
		</g:hasErrors>
		<form action="${createLink(action: 'save')}" method="post" role="form">
			<g:render template="form"/>
			<fieldset class="buttons">
				<g:submitButton name="save" class="btn btn-default" value="Save" />
			</fieldset>
		</form>
	</body>
</html>
