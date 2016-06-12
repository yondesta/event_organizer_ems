<%@ page import="groovy.time.TimeCategory" %>
<ul class="chat">
    <g:each in="${notifications}" var="notification" status="idx">
        <li class="left clearfix">
            <span class="chat-img pull-left">
                <button class="btn ${notification.event.category.buttonClass} btn-circle" type="button">
                    <i class="fa ${notification.event.category.icon}"></i>
                </button>
            </span>
            <div class="chat-body clearfix">
                <div class="header">
                    <strong class="primary-font">${notification.event.title} - ${notification.title}</strong>
                    <small class="pull-right text-muted">
                        <i class="fa fa-clock-o fa-fw"></i> ${notification.elapsedTime}
                    </small>
                </div>
                <p>${notification.message}</p>
            </div>
        </li>
    </g:each>
</ul>