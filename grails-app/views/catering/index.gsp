
<%@ page import="et.resources.Catering" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'catering.label', default: 'Catering')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-catering" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-catering" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="email" title="${message(code: 'catering.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'catering.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="lunchPrice" title="${message(code: 'catering.lunchPrice.label', default: 'Lunch Price')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'catering.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="phone" title="${message(code: 'catering.phone.label', default: 'Phone')}" />
					
						<g:sortableColumn property="snackPrice" title="${message(code: 'catering.snackPrice.label', default: 'Snack Price')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${cateringInstanceList}" status="i" var="cateringInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${cateringInstance.id}">${fieldValue(bean: cateringInstance, field: "email")}</g:link></td>
					
						<td>${fieldValue(bean: cateringInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: cateringInstance, field: "lunchPrice")}</td>
					
						<td>${fieldValue(bean: cateringInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: cateringInstance, field: "phone")}</td>
					
						<td>${fieldValue(bean: cateringInstance, field: "snackPrice")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${cateringInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
