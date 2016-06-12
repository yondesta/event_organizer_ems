<%@ page import="et.event.UserEvent" %>
<table class="table table-bordered" id="eventTable">
    <thead>
        <tr>
            <th>Event</th>
            <th>Cat.</th>
            <th>Start Date</th>
            <th>End Date</th>
            <th>Owner</th>
            <th>Open</th>
            <th>Participants</th>
        </tr>
    </thead>
    <tbody>
        <g:each in="${userEvents}" var="event" status="idx">
            <tr>
                <td>${event.title}</td>
                <td class="text-center">
                    %{--<ems:eventButton eventId="${event.id}"/>--}%
                    <button class="btn ${event.category.buttonClass} btn-circle" type="button">
                        <i class="fa ${event.category.icon}"></i>
                    </button>
                </td>
                <td class="text-center">${event.startDate.format('dd/MM/yyyy')}</td>
                <td class="text-center">${event.endDate.format('dd/MM/yyyy')}</td>
                <td>${event.owner}</td>
                <td class="text-center"><i class="fa ${event.isOpen ? 'fa-check' : 'fa-times'}"></i></td>
                <td class="text-right">${UserEvent.countByEvent(event)} (${event.maxParticipants - UserEvent.countByEvent(event)})</td>
            </tr>
        </g:each>
    </tbody>
</table>
<script>
    $('#eventTable').dataTable();
</script>