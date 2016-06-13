<%@ page import="et.participant.User; et.event.Category; et.event.Event" %>

<div class="row">
    <div class="col-lg-4">
        <div class="form-group ${hasErrors(bean: eventInstance, field: 'title', 'has-error')}">
			<label class="control-label" for="title">Title
				<span class="required-indicator">*</span>
			</label>
			<g:textField class="form-control" name="title" value="${eventInstance?.title}"/>
		</div>
		<div class="form-group ${hasErrors(bean: eventInstance, field: 'description', 'has-error')}">
			<label class="control-label" for="description">Description</label>
			<g:textField class="form-control" name="description" value="${eventInstance?.description}"/>
		</div>
		<div class="form-group ${hasErrors(bean: eventInstance, field: 'phone', 'has-error')}">
			<label class="control-label" for="phone">Phone</label>
			<g:textField class="form-control" name="phone" value="${eventInstance?.phone}"/>
		</div>
		<div class="form-group ${hasErrors(bean: eventInstance, field: 'email', 'has-error')}">
			<label class="control-label" for="email">Email</label>
			<g:textField class="form-control" name="email" value="${eventInstance?.email}"/>
		</div>
	</div>
	<div class="col-lg-4">
		<div class="form-group ${hasErrors(bean: eventInstance, field: 'category', 'has-error')}">
			<label class="control-label" for="category">Category
				<span class="required-indicator">*</span>
			</label>
			<g:select id="category" name="category.id" from="${et.event.Category.list()}" optionKey="id"
					  optionValue="name" value="${eventInstance?.category?.id}" class="many-to-one form-control"
					  noSelection="['null': '']"/>
		</div>
		<div class="form-group ${hasErrors(bean: eventInstance, field: 'startDate', 'has-error')}">
			<label class="control-label" for="startDate">Start Date
				<span class="required-indicator">*</span>
			</label>
			<g:datePicker name="startDate" precision="day"  value="${eventInstance?.startDate}" class="form-control"/>
		</div>
		<div class="form-group ${hasErrors(bean: eventInstance, field: 'endDate', 'has-error')}">
			<label class="control-label" for="endDate">End Date
				<span class="required-indicator">*</span>
			</label>
			<g:datePicker name="endDate" precision="day"  value="${eventInstance?.endDate}" class="form-control"/>
		</div>
	</div>
	<div class="col-lg-4">
		<div class="form-group ${hasErrors(bean: eventInstance, field: 'owner', 'has-error')}">
			<label class="control-label" for="owner">Owner
				<span class="required-indicator">*</span>
			</label>
			<g:select id="owner" name="owner.id" from="${owners}" optionKey="id"
					  value="${eventInstance?.owner?.id}" class="many-to-one form-control"
					  noSelection="['null': '']"/>
		</div>
		<div class="form-group ${hasErrors(bean: eventInstance, field: 'venue', 'has-error')}">
			<label class="control-label" for="venue">Venue
				<span class="required-indicator">*</span>
			</label>
			<g:select  id="venue" name="venue.id" from="${et.resources.Venue.list()}" optionKey="id"
					   optionValue="name" value="${eventInstance?.venue?.id}" class="many-to-one form-control"
					   noSelection="['null': '']"/>
		</div>
		<div class="form-group ${hasErrors(bean: eventInstance, field: 'maxParticipants', 'has-error')}">
			<label class="control-label" for="maxParticipants">Max Participant</label>
			<input class="form-control" id="maxParticipants" name="maxParticipants" value="${eventInstance?.maxParticipants}" type="number" min="0" step="1"/>
		</div>
	</div>
</div>

