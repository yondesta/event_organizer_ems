
<%@ page import="et.event.Event" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="ems">
		<title>${eventInstance.title} details</title>
	</head>
	<body>
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">${eventInstance.title} details</h1>
			</div>
		</div>
		<g:if test="${flash.message}">
			<div class="alert ${flash.messageType ?: 'alert-info'} alert-dismissable" role="status">${flash.message}
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
			</div>
		</g:if>
		<div class="row">
			<div class="lg-12">
				<div class="table-responsive">
					<table class="table">
						<thead>
							<tr>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tboby>
							<tr>
								<td>Title</td>
								<td><g:fieldValue bean="${eventInstance}" field="title"/></td>
							</tr>
							<tr>
								<td>Description</td>
								<td><g:fieldValue bean="${eventInstance}" field="description"/></td>
							</tr>
							<tr>
								<td>Category</td>
								<td>${eventInstance.category.name}</td>
							</tr>
							<tr>
								<td>Start Date</td>
								<td>${eventInstance.startDate.format('dd/MM/yyyy')}</td>
							</tr>
							<tr>
								<td>End Date</td>
								<td>${eventInstance.endDate.format('dd/MM/yyyy')}</td>
							</tr>
							<tr>
								<td>Phone</td>
								<td><g:fieldValue bean="${eventInstance}" field="phone"/></td>
							</tr>
							<tr>
								<td>Email</td>
								<td><g:fieldValue bean="${eventInstance}" field="email"/></td>
							</tr>
							<tr>
								<td>Venue</td>
								<td><g:fieldValue bean="${eventInstance}" field="venue"/></td>
							</tr>
						</tboby>
					</table>
				</div>
			</div>
		</div>
		<g:form url="[resource:eventInstance, action:'delete']" method="DELETE">
			<fieldset class="buttons">
				<g:actionSubmit class="btn btn-primary" action="edit" value="Edit" resource="${eventInstance}"/>
				<g:actionSubmit class="btn btn-default" action="delete" value="Delete" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
			</fieldset>
		</g:form>
		</div>
	</body>
</html>
