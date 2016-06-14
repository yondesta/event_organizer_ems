<br>
<div class="panel panel-default">
    <div class="panel-heading">
        <i class="fa fa-clock-o fa-fw"></i> Live Event Updates
    </div>
    <div class="panel-body">
        <ul class="timeline">
            <g:each in="${updates}" var="update" status="idx">
                <li class="${idx % 2 == 0 ? '' : 'timeline-inverted'}">
                    <div class="timeline-badge ${update.color}"><i class="fa ${update.icon}"></i>
                    </div>
                    <div class="timeline-panel">
                        <div class="timeline-heading">
                            <h4 class="timeline-title">${update.title}</h4>
                            <p><small class="text-muted"><i class="fa fa-clock-o"></i> ${update.elapsedTime}</small>
                            </p>
                        </div>
                        <div class="timeline-body">
                            <p>${update.message}</p>
                        </div>
                    </div>
                </li>
            </g:each>
        </ul>
    </div>
</div>