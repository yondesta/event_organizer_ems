
<%@ page import="et.event.Event" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="ems">
		<g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">Welcome to EMS! <small>...check our upcoming events!</small></h1>
				</div>
				<g:if test="${flash.message}">
					<div class="alert ${flash.messageType ?: 'alert-info'} alert-dismissable" role="status">${flash.message}
						<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
					</div>
				</g:if>
			</div>
			<div class="row">
				<g:each in="${events}" var="event" status="idx">
					<div class="col-lg-3 col-md-6">
						<div class="panel ${event.category.color}">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa ${event.category.icon} fa-5x"></i>
									</div>
									<div class="col-xs-9 text-right">
										<div class="huge">${event.title}</div>
									</div>
								</div>
								<div class="row">
									<div class="col-xs-6">
										<div>${event.partecipants ? event.partecipants.size() : 0} participants</div>
									</div>
									<div class="col-xs-6 text-right">
										<div>${event.maxParticipants - (event.partecipants ? event.partecipants.size() : 0)} available</div>
									</div>
								</div>
							</div>
							<a href="#">
								<div class="panel-footer">
									<span class="pull-left">${event.startDate.format('dd/MM/yyy')} - ${event.endDate.format('dd/MM/yyy')}</span>
									<span class="pull-right"><i class="fa fa-calendar-o"></i></span>
									<div class="clearfix"></div>
								</div>
							</a>
						</div>
					</div>
				</g:each>
			</div>
	</body>
</html>
