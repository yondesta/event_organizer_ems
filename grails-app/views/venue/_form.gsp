<%@ page import="et.resources.Venue" %>


<div class="row">
	<div class="col-lg-4">
        <div class="form-group ${hasErrors(bean: venueInstance, field: 'name', 'has-error')}">
			<label class="control-label" for="name">Name
				<span class="required-indicator">*</span>
			</label>
			<g:textField class="form-control" name="name" value="${venueInstance?.name}"/>
		</div>
	</div>
	<div class="col-lg-4">
	<div class="form-group ${hasErrors(bean: venueInstance, field: 'description', 'has-error')}">
			<label class="control-label" for="description">Description</label>
			<g:textField class="form-control" name="description" value="${venueInstance?.description}"/>
		</div>
	</div>
	<div class="col-lg-4">
		<div class="form-group ${hasErrors(bean: venueInstance, field: 'phone', 'has-error')}">
			<label class="control-label" for="phone">Phone</label>
			<g:textField class="form-control" name="phone" value="${venueInstance?.phone}"/>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-lg-4">
		<div class="form-group ${hasErrors(bean: venueInstance, field: 'email', 'has-error')}">
			<label class="control-label" for="email">Email</label>
			<g:textField class="form-control" name="email" value="${venueInstance?.email}"/>
		</div>
	</div>
	<div class="col-lg-4">
		<div class="form-group ${hasErrors(bean: venueInstance, field: 'pricePerDay', 'has-error')}">
			<label class="control-label" for="email">Price per Day
				<span class="required-indicator">*</span>
			</label>
			<input type="number" class="form-control" name="pricePerDay" id="pricePerDay" min="0" step="10"
				   value="${fieldValue(bean: venueInstance, field: 'pricePerDay')}">
		</div>
	</div>
	<div class="col-lg-4">
		<div class="form-group ${hasErrors(bean: venueInstance, field: 'seatsNumber', 'has-error')}">
			<label class="control-label" for="email">Seats Number
				<span class="required-indicator">*</span>
			</label>
			<input type="number" class="form-control" name="seatsNumber" id="seatsNumber" min="0" step="1"
				   value="${fieldValue(bean: venueInstance, field: 'seatsNumber')}">
		</div>
	</div>
</div>
<div class="row">
	<div class="col-lg-4">
		<div class="form-group ${hasErrors(bean: venueInstance, field: 'owner', 'has-error')}">
			<label class="control-label" for="catering">Owner
				<span class="required-indicator">*</span>
			</label>
			<g:select id="owner" name="owner.id" from="${owners}" optionKey="id"
					  value="${venueInstance?.owner?.id}" class="many-to-one form-control"
					  noSelection="['null': '']"/>
		</div>
	</div>
	<div class="col-lg-4">
		<div class="form-group ${hasErrors(bean: venueInstance, field: 'catering', 'has-error')}">
			<label class="control-label" for="catering">Catering</label>
			<g:select  id="catering" name="catering.id" from="${et.resources.Catering.list()}" optionKey="id"
					   optionValue="name" value="${venueInstance?.catering?.id}" class="many-to-one form-control"
					   noSelection="['null': '']"/>
		</div>
	</div>
	<div class="col-lg-4">
		<div class="form-group ${hasErrors(bean: venueInstance, field: 'location', 'has-error')}">
			<label class="control-label" for="location">Location
				<span class="required-indicator">*</span>
			</label>
			<g:textField class="form-control" name="location" value="${venueInstance?.location}"/>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-lg-4">
		<div class="form-group">
			<div class="checkbox">
				<label>
					<g:checkBox name="projectorAvailable" value="${venueInstance?.projectorAvailable}" />Projector available
				</label>
			</div>
			<div class="checkbox">
				<label>
					<g:checkBox name="speakersAvailable" value="${venueInstance?.speakersAvailable}" />Speaker available
				</label>
			</div>
			<div class="checkbox">
				<label>
					<g:checkBox name="ushersAvailable" value="${venueInstance?.ushersAvailable}" />Usher available
				</label>
			</div>
		</div>
	</div>
</div>
