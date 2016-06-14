<div class="col-lg-12">
    <div class="row well">
        <form action="${createLink(controller: 'liveUpdate', action: 'save')}" role="form" method="post">
            <div class="col-lg-2">
                <div class="form-group">
                    <label class="control-label">Type</label>
                    <g:select class="form-control" name="color" from="${['default', 'info', 'success', 'warning', 'danger']}" value="default"/>
                </div>
            </div>
            <div class="col-lg-2">
                <div class="form-group">
                    <label class="control-label">Icon</label>
                    <g:select class="form-control" name="icon" from="${['fa-save', 'fa-check', 'fa-badge', 'fa-bomb', 'fa-graduation-cap']}"  value="default"/>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="form-group">
                    <label class="control-label">Title</label>
                    <input type="text" name="title" class="form-control" required/>
                </div>
            </div>
            <div class="col-lg-5">
                <div class="form-group">
                    <label class="control-label">Message</label>
                    <input type="text" name="message" class="form-control" required/>
                </div>
            </div>
            <g:hiddenField name="event.id" value="${eventInstance.id}"/>
            <div class="col-lg-12">
                <button type="submit" class="btn btn-primary">Send</button>
            </div>
        </form>
    </div>
</div>