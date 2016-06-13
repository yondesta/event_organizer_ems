<%@ page import="org.springframework.validation.FieldError" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="ems">
		<title>Add Catering></title>
	</head>
	<body>
		<div class="row">
			<div class="col-lg-12">	
			<h1 class="page-header">Add Catering</h1>
			</div>
		</div>
			<g:if test="${flash.message}">
			<div class="alert ${flash.messageType ?: 'alert-info'} alert-dismissable" role="status">${flash.message}
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
			</div>
			</g:if>
			<g:hasErrors bean="${cateringInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${cateringInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:cateringInstance, action:'save']" role="form" >
				<g:render template="form"/>
					<fieldset class="buttons">
					<g:submitButton name="create" class="btn btn-default" value="Save" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
