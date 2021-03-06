<%@ page import="org.springframework.validation.FieldError" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="ems">
		<title>Create New Venue</title>
	</head>
	<body>
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Create New Venue</h1>
			</div>
		</div>
		<g:if test="${flash.message}">
			<div class="alert ${flash.messageType ?: 'alert-info'} alert-dismissable" role="status">${flash.message}
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
			</div>
		</g:if>
		<g:hasErrors bean="${venueInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${venueInstance}" var="error">
					<li <g:if test="${error in FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		<g:form url="[resource: venueInstance, action:'save']" role="form">
			<g:render template="form"/>
			<fieldset class="buttons">
				<g:submitButton name="create" class="btn btn-primary" value="Save" />
				<button type="button" onclick="clearFields()" name="clear" class="btn btn-default">Clear</button>
			</fieldset>
		</g:form>
		<script>
			var clearFields = function() {
				$('.form-control').val('');
				$('input[type="checkbox"]').prop('checked', false);
				$('input[type="radio"]').prop('checked', false);
			};
		</script>
	</body>
</html>
