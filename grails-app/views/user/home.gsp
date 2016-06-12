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
        <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_FACILITATOR">
            <g:render template="eventTable"/>
        </sec:ifAnyGranted>
        <sec:ifNotGranted roles="ROLE_ADMIN, ROLE_FACILITATOR">
            <g:render template="eventTiles"/>
        </sec:ifNotGranted>
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