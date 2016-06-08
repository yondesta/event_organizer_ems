
<%@ page import="et.resources.Venue" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'venue.label', default: 'Venue')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-venue" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-venue" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list venue">
			
				<g:if test="${venueInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="venue.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${venueInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${venueInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="venue.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${venueInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${venueInstance?.phone}">
				<li class="fieldcontain">
					<span id="phone-label" class="property-label"><g:message code="venue.phone.label" default="Phone" /></span>
					
						<span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${venueInstance}" field="phone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${venueInstance?.catering}">
				<li class="fieldcontain">
					<span id="catering-label" class="property-label"><g:message code="venue.catering.label" default="Catering" /></span>
					
						<span class="property-value" aria-labelledby="catering-label"><g:link controller="catering" action="show" id="${venueInstance?.catering?.id}">${venueInstance?.catering?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${venueInstance?.availabilities}">
				<li class="fieldcontain">
					<span id="availabilities-label" class="property-label"><g:message code="venue.availabilities.label" default="Availabilities" /></span>
					
						<g:each in="${venueInstance.availabilities}" var="a">
						<span class="property-value" aria-labelledby="availabilities-label"><g:link controller="availability" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${venueInstance?.location}">
				<li class="fieldcontain">
					<span id="location-label" class="property-label"><g:message code="venue.location.label" default="Location" /></span>
					
						<span class="property-value" aria-labelledby="location-label"><g:fieldValue bean="${venueInstance}" field="location"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${venueInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="venue.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${venueInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${venueInstance?.owner}">
				<li class="fieldcontain">
					<span id="owner-label" class="property-label"><g:message code="venue.owner.label" default="Owner" /></span>
					
						<span class="property-value" aria-labelledby="owner-label"><g:link controller="user" action="show" id="${venueInstance?.owner?.id}">${venueInstance?.owner?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${venueInstance?.pricePerDay}">
				<li class="fieldcontain">
					<span id="pricePerDay-label" class="property-label"><g:message code="venue.pricePerDay.label" default="Price Per Day" /></span>
					
						<span class="property-value" aria-labelledby="pricePerDay-label"><g:fieldValue bean="${venueInstance}" field="pricePerDay"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${venueInstance?.projectorAvailable}">
				<li class="fieldcontain">
					<span id="projectorAvailable-label" class="property-label"><g:message code="venue.projectorAvailable.label" default="Projector Available" /></span>
					
						<span class="property-value" aria-labelledby="projectorAvailable-label"><g:formatBoolean boolean="${venueInstance?.projectorAvailable}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${venueInstance?.seatsNumber}">
				<li class="fieldcontain">
					<span id="seatsNumber-label" class="property-label"><g:message code="venue.seatsNumber.label" default="Seats Number" /></span>
					
						<span class="property-value" aria-labelledby="seatsNumber-label"><g:fieldValue bean="${venueInstance}" field="seatsNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${venueInstance?.speakersAvailable}">
				<li class="fieldcontain">
					<span id="speakersAvailable-label" class="property-label"><g:message code="venue.speakersAvailable.label" default="Speakers Available" /></span>
					
						<span class="property-value" aria-labelledby="speakersAvailable-label"><g:formatBoolean boolean="${venueInstance?.speakersAvailable}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${venueInstance?.ushersAvailable}">
				<li class="fieldcontain">
					<span id="ushersAvailable-label" class="property-label"><g:message code="venue.ushersAvailable.label" default="Ushers Available" /></span>
					
						<span class="property-value" aria-labelledby="ushersAvailable-label"><g:formatBoolean boolean="${venueInstance?.ushersAvailable}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:venueInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${venueInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
