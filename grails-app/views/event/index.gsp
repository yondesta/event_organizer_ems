
<%@ page import="et.event.Event" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="ems">
		<g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-event" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-event" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="title" title="${message(code: 'event.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'event.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="phone" title="${message(code: 'event.phone.label', default: 'Phone')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'event.email.label', default: 'Email')}" />
					
						<th><g:message code="event.catering.label" default="Catering" /></th>
					
						<g:sortableColumn property="category" title="${message(code: 'event.category.label', default: 'Category')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${eventInstanceList}" status="i" var="eventInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${eventInstance.id}">${fieldValue(bean: eventInstance, field: "title")}</g:link></td>
					
						<td>${fieldValue(bean: eventInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: eventInstance, field: "phone")}</td>
					
						<td>${fieldValue(bean: eventInstance, field: "email")}</td>
					
						<td>${fieldValue(bean: eventInstance, field: "catering")}</td>
					
						<td>${fieldValue(bean: eventInstance, field: "category")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${eventInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
