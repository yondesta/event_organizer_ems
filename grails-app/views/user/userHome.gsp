<%@ page import="groovy.time.TimeCategory; et.event.UserEvent" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="ems">
    <title>User home</title>
</head>
<body>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">${userInstance} Home</h1>
    </div>
</div>
<g:if test="${flash.message}">
    <div class="alert ${flash.messageType ?: 'alert-info'} alert-dismissable" role="status">${flash.message}
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
    </div>
</g:if>
<div class="row">
    <div class="col-lg-6">
        <g:each in="${userEvents}" var="event" status="idx">
        <div class="col-lg-6 col-md-12">
            <div class="panel ${event.category.panelClass}">
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
                        <div class="col-xs-12 text-right">
                            <div>${event.maxParticipants - et.event.UserEvent.countByEvent(event)} available</div>
                        </div>
                    </div>
                </div>
                <a href="${createLink(controller: 'event', action: 'show', id: event.id)}" title="Event details">
                    <div class="panel-footer">
                        <span class="pull-left">${event.startDate.format('dd/MM/yyy')} - ${event.endDate.format('dd/MM/yyy')}</span>
                        <span class="pull-right"><i class="fa fa-arrow-circle-o-right "></i></span>
                        <div class="clearfix"></div>
                    </div>
                </a>
            </div>
        </div>
    </g:each>
    </div>
    <div class="col-lg-6">
        <div class="chat-panel panel panel-default">
            <div class="panel-heading">
                <i class="fa fa-comments fa-fw"></i>
                Events Updates
                <div class="btn-group pull-right">
                <a href="#">
                    <i class="fa fa-refresh fa-fw"></i>
                </a>
                </div>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <ul class="chat">
                    <g:each in="${eventsNotifications}" var="notification" status="idx">
                        <li class="left clearfix">
                            <span class="chat-img pull-left">
                                <button class="btn ${notification.event.category.buttonClass} btn-circle btn-sm" type="button">
                                    <i class="fa ${notification.event.category.icon}"></i>
                                </button>
                            </span>
                            <div class="chat-body clearfix">
                                <div class="header">
                                    <strong class="primary-font">${notification.title}</strong>
                                    <small class="pull-right text-muted">
                                        <i class="fa fa-clock-o fa-fw"></i> ${groovy.time.TimeCategory.minus(new Date(),notification.dateCreated)}
                                    </small>
                                </div>
                                <p>
                                    ${notification.message}
                                </p>
                            </div>
                        </li>
                    </g:each>
                </ul>
            </div>
            <!-- /.panel-body -->
        </div>
    </div>
</div>
</body>
</html>