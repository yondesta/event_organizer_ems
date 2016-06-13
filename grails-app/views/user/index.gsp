
<%@ page import="et.event.UserEvent; et.participant.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="ems">
		<title>User List</title>
	</head>
	<body>
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">User List</h1>
		</div>
	</div>
	<g:if test="${flash.message}">
		<div class="alert ${flash.messageType ?: 'alert-info'} alert-dismissable" role="status">${flash.message}
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
		</div>
	</g:if>
	<div class="row">
		<div class="col-lg-12">
			<table class="table table-bordered" id="userTable">
				<thead>
					<tr>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Age</th>
						<th>Events</th>
						<th>Roles</th>
						<th>Locked</th>
						<th>Active</th>
					</tr>
				</thead>
				<tbody>
					<g:each in="${User.list()}" var="user" status="idx">
						<tr>
							<td>${user.firstName.capitalize()}</td>
							<td>${user.lastName.capitalize()}</td>
							<td class="text-rigth">${user.age}</td>
							<td>${UserEvent.countByParticipant(user)}</td>
							<td>${user.getAuthorities().authority.join(', ')}</td>
							<td class="text-center"><i class="fa ${user.accountLocked ? 'fa-lock' : 'fa-unlock'}"></i></td>
							<td class="text-center"><i class="fa ${user.accountExpired ? 'fa-times' : 'fa-check'}"></i></td>
						</tr>
					</g:each>
				</tbody>
			</table>
		</div>
	</div>
	<script>
		$('#userTable').dataTable();
	</script>
	</body>
</html>
