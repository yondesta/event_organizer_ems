
<%@ page import="et.resources.Venue" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'venue.label', default: 'Venue')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-venue" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-venue" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="description" title="${message(code: 'venue.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'venue.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="phone" title="${message(code: 'venue.phone.label', default: 'Phone')}" />
					
						<th><g:message code="venue.catering.label" default="Catering" /></th>
					
						<g:sortableColumn property="location" title="${message(code: 'venue.location.label', default: 'Location')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'venue.name.label', default: 'Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${venueInstanceList}" status="i" var="venueInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${venueInstance.id}">${fieldValue(bean: venueInstance, field: "description")}</g:link></td>
					
						<td>${fieldValue(bean: venueInstance, field: "email")}</td>
					
						<td>${fieldValue(bean: venueInstance, field: "phone")}</td>
					
						<td>${fieldValue(bean: venueInstance, field: "catering")}</td>
					
						<td>${fieldValue(bean: venueInstance, field: "location")}</td>
					
						<td>${fieldValue(bean: venueInstance, field: "name")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${venueInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
