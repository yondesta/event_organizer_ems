
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
			<div class="col-lg-8">
				<div class="row">
					<div class="col-lg-5">
						<img src="${createLink(uri: '/images/')}${eventInstance.venue.picture}" width="100%"/>
					</div>
					<div class="col-lg-7">
						<p>${eventInstance.description}</p>
					</div>
				</div>
				<br>
				<g:if test="${canAddLiveUpdates}">
					<g:render template="/liveUpdate/addLiveUpdate" model="[eventInstance: eventInstance]"/>
				</g:if>
				<br>
				<div class="row">
					<div id="timeline" class="col-lg-12">
						<g:if test="${!eventInstance.isLive}">
							<g:render template="countdown" model="[eventInstance: eventInstance]"/>
						</g:if>
					</div>
				</div>
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
				<g:if test="${canSendNotification}">
					<g:render template="sendNotification" model="[eventInstance: eventInstance]"/>
				</g:if>
			</div>
		</div>
		<div class="row">

		</div>
		<sec:ifAllGranted roles="ROLE_EVENT_OWNER">
			<g:form url="[resource:eventInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:actionSubmit class="btn btn-primary" action="edit" value="Edit" resource="${eventInstance}"/>
					<g:actionSubmit class="btn btn-default" action="delete" value="Delete" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</sec:ifAllGranted>
		<script>
			var isLive = "${eventInstance.isLive}";
			var getLiveUpdates = function() {
				$.ajax({
					url: "${createLink(controller: 'liveUpdate', action: 'renderLiveUpdates')}",
					type: 'post',
					dataType: 'html',
					data: {
						eventId: "${eventInstance.id}"
					}
				}).success(function(data) {
					$('#timeline').html(data);
				}).error(function() {
					// Do nothing
				})
			}
			if (isLive  === 'true') {
				getLiveUpdates();
				setInterval(function(){
					getLiveUpdates();
				}, 10000);
			}
	</script>
	</body>
</html>
