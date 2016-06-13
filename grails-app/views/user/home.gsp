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
    <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_FACILITATOR">
        <g:render template="eventTable"/>
    </sec:ifAnyGranted>
    <sec:ifNotGranted roles="ROLE_ADMIN, ROLE_FACILITATOR">
        <g:render template="eventTiles"/>
    </sec:ifNotGranted>
</div>
</body>
</html>