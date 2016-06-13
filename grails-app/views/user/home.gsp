<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="ems">
    <title>Event Owner Home</title>
</head>
<body>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Welcome ${userInstance}</h1>
    </div>
</div>
<g:if test="${flash.message}">
    <div class="alert ${flash.messageType ?: 'alert-info'} alert-dismissable" role="status">${flash.message}
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
    </div>
</g:if>
<div class="row">
    <div class="col-lg-8">
        <g:each in="${userEvents}" var="event" status="idx">
            <div class="col-lg-6 col-md-12">
                <div class="panel ${event.category.panelClass}">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa ${event.category.icon} fa-3x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">${event.title}</div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 text-right">
                                <div>${event.maxParticipants - et.event.UserEvent.countByEvent(event)} places available</div>
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
    <div class="col-lg-4">
        <div class="chat-panel panel panel-default">
            <div class="panel-heading">
                <i class="fa fa-comments fa-fw"></i>
                Events Updates
                <div class="btn-group pull-right">
                    <a id="refresh" href="#">
                        <i class="fa fa-refresh fa-fw"></i>
                    </a>
                </div>
            </div>
            <!-- /.panel-heading -->
            <div id="panel-body" class="panel-body"></div>
            <!-- /.panel-body -->
        </div>
    </div>
</div>
<script type="text/javascript">
    var loadNotifications = function() {
        $.ajax({
            url: "${createLink(controller: 'notification', action: 'renderNotifications')}",
            type: 'POST',
            dataType: 'html',
            data: {
                userId: "${userInstance.id}"
            }
        }).success(function(data) {
            $('#panel-body').html(data);
        }).error(function() {
            alert('Could not load notification.');

        });
    };
    loadNotifications();

    $('#refresh').click(function() {
        loadNotifications();
    })
</script>
</body>
</html>