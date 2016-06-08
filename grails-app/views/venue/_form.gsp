<%@ page import="et.resources.Venue" %>



<div class="fieldcontain ${hasErrors(bean: venueInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="venue.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${venueInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: venueInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="venue.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${venueInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: venueInstance, field: 'phone', 'error')} ">
	<label for="phone">
		<g:message code="venue.phone.label" default="Phone" />
		
	</label>
	<g:textField name="phone" value="${venueInstance?.phone}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: venueInstance, field: 'catering', 'error')} ">
	<label for="catering">
		<g:message code="venue.catering.label" default="Catering" />
		
	</label>
	<g:select id="catering" name="catering.id" from="${et.resources.Catering.list()}" optionKey="id" value="${venueInstance?.catering?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: venueInstance, field: 'availabilities', 'error')} ">
	<label for="availabilities">
		<g:message code="venue.availabilities.label" default="Availabilities" />
		
	</label>
	<g:select name="availabilities" from="${et.resources.Availability.list()}" multiple="multiple" optionKey="id" size="5" value="${venueInstance?.availabilities*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: venueInstance, field: 'location', 'error')} required">
	<label for="location">
		<g:message code="venue.location.label" default="Location" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="location" required="" value="${venueInstance?.location}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: venueInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="venue.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${venueInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: venueInstance, field: 'owner', 'error')} required">
	<label for="owner">
		<g:message code="venue.owner.label" default="Owner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="owner" name="owner.id" from="${et.participant.User.list()}" optionKey="id" required="" value="${venueInstance?.owner?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: venueInstance, field: 'pricePerDay', 'error')} required">
	<label for="pricePerDay">
		<g:message code="venue.pricePerDay.label" default="Price Per Day" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="pricePerDay" value="${fieldValue(bean: venueInstance, field: 'pricePerDay')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: venueInstance, field: 'projectorAvailable', 'error')} ">
	<label for="projectorAvailable">
		<g:message code="venue.projectorAvailable.label" default="Projector Available" />
		
	</label>
	<g:checkBox name="projectorAvailable" value="${venueInstance?.projectorAvailable}" />

</div>

<div class="fieldcontain ${hasErrors(bean: venueInstance, field: 'seatsNumber', 'error')} required">
	<label for="seatsNumber">
		<g:message code="venue.seatsNumber.label" default="Seats Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="seatsNumber" type="number" value="${venueInstance.seatsNumber}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: venueInstance, field: 'speakersAvailable', 'error')} ">
	<label for="speakersAvailable">
		<g:message code="venue.speakersAvailable.label" default="Speakers Available" />
		
	</label>
	<g:checkBox name="speakersAvailable" value="${venueInstance?.speakersAvailable}" />

</div>

<div class="fieldcontain ${hasErrors(bean: venueInstance, field: 'ushersAvailable', 'error')} ">
	<label for="ushersAvailable">
		<g:message code="venue.ushersAvailable.label" default="Ushers Available" />
		
	</label>
	<g:checkBox name="ushersAvailable" value="${venueInstance?.ushersAvailable}" />

</div>

