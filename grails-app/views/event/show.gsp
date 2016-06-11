
<%@ page import="et.event.UserEvent; et.event.Event" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="ems">
		<title>${eventInstance.title} details</title>
	</head>
	<body>
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					<button class="btn ${eventInstance.category.buttonClass} btn-circle btn-lg" type="button">
						<i class="fa ${eventInstance.category.icon}"></i>
					</button>
					${eventInstance.title.toUpperCase()}
					<small>${eventInstance.startDate.format('dd/MM/yyyy')} - ${eventInstance.endDate.format('dd/MM/yyyy')}</small>
				</h1>

			</div>
		</div>
		<g:if test="${flash.message}">
			<div class="alert ${flash.messageType ?: 'alert-info'} alert-dismissable" role="status">${flash.message}
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
			</div>
		</g:if>
		<div class="row">
			<div class="col-lg-3">
				<img src="${createLink(uri: '/images/')}${eventInstance.venue.picture}" width="100%"/>
			</div>
			<div class="col-lg-5">
				<p>${eventInstance.description}</p>
			</div>
			<div class="col-lg-4">
				<div class="well">
					<h2>${eventInstance.maxParticipants - UserEvent.countByEvent(eventInstance)} <small>available places</small></h2>
					<em>Registration deadline: </em><strong>${eventInstance.registrationDeadline.format('dd/MM/yyyy')}</strong>
					<g:if test="${isRegistrationOpen}">
						<div class="text-right">
							<form action="${createLink(controller: 'event', action: 'registerUser', id: eventInstance.id)}" role="form">
								<button class="btn btn-default" type="submit">Register</button>
							</form>
						</div>
					</g:if>
				</div>
				<div class="panel panel-info">
					<div class="panel-heading">Contacts</div>
					<div class="panel-body">
						<p>Email: <strong>${eventInstance.email}</strong></p>
						<p>Phone: <strong>${eventInstance.phone}</strong></p>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<g:if test="${isEventOwner}">
				<div class="col-lg-4">
					<div class="panel panel-default">
						<div class="panel-heading">
							Send Notification
						</div>
						<form action="${createLink(controller: 'notification', action: 'sendNotification')}" role="form">
							<div class="panel-body">
								<div class="form-group">
									<input class="form-control" placeholder="Title" name="title" type="text"/>
								</div>
								<div class="form-group">
									<textarea class="form-control" placeholder="Message" name="message" cols="3"></textarea>
								</div>
								<g:hiddenField name="event.id" value="${eventInstance.id}"/>
							</div>
							<div class="panel-footer text-right">
								<button type="submit" class="btn btn-primary">Send</button>
							</div>
						</form>
					</div>
				</div>
			</g:if>
		</div>
		<sec:ifAllGranted roles="ROLE_EVENT_OWNER">
			<g:form url="[resource:eventInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:actionSubmit class="btn btn-primary" action="edit" value="Edit" resource="${eventInstance}"/>
					<g:actionSubmit class="btn btn-default" action="delete" value="Delete" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</sec:ifAllGranted>
	</body>
</html>
