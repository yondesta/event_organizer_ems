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