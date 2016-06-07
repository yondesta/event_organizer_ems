<%@ page import="et.event.Event" %>



<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="event.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${eventInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="event.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${eventInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'phone', 'error')} ">
	<label for="phone">
		<g:message code="event.phone.label" default="Phone" />
		
	</label>
	<g:textField name="phone" value="${eventInstance?.phone}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="event.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${eventInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'partecipants', 'error')} ">
	<label for="partecipants">
		<g:message code="event.partecipants.label" default="Partecipants" />
		
	</label>
	<g:select name="partecipants" from="${et.participant.User.list()}" multiple="multiple" optionKey="id" size="5" value="${eventInstance?.partecipants*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'category', 'error')} required">
	<label for="category">
		<g:message code="event.category.label" default="Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="category" required="" value="${eventInstance?.category}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'endDate', 'error')} required">
	<label for="endDate">
		<g:message code="event.endDate.label" default="End Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="endDate" precision="day"  value="${eventInstance?.endDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'owner', 'error')} required">
	<label for="owner">
		<g:message code="event.owner.label" default="Owner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="owner" name="owner.id" from="${et.participant.User.list()}" optionKey="id" required="" value="${eventInstance?.owner?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'startDate', 'error')} required">
	<label for="startDate">
		<g:message code="event.startDate.label" default="Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startDate" precision="day"  value="${eventInstance?.startDate}"  />

</div>

