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