<%@ page import="org.springframework.validation.FieldError; et.event.Event" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="ems">
		<title>Edit Event</title>
	</head>
	<body>
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Edit Event</h1>
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
					<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:eventInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${eventInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="btn btn-primary" action="update" value="Update" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
