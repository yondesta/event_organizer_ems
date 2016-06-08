
<%@ page import="et.resources.Catering" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'catering.label', default: 'Catering')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-catering" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-catering" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list catering">
			
				<g:if test="${cateringInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="catering.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${cateringInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cateringInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="catering.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${cateringInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cateringInstance?.lunchPrice}">
				<li class="fieldcontain">
					<span id="lunchPrice-label" class="property-label"><g:message code="catering.lunchPrice.label" default="Lunch Price" /></span>
					
						<span class="property-value" aria-labelledby="lunchPrice-label"><g:fieldValue bean="${cateringInstance}" field="lunchPrice"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cateringInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="catering.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${cateringInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cateringInstance?.phone}">
				<li class="fieldcontain">
					<span id="phone-label" class="property-label"><g:message code="catering.phone.label" default="Phone" /></span>
					
						<span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${cateringInstance}" field="phone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cateringInstance?.snackPrice}">
				<li class="fieldcontain">
					<span id="snackPrice-label" class="property-label"><g:message code="catering.snackPrice.label" default="Snack Price" /></span>
					
						<span class="property-value" aria-labelledby="snackPrice-label"><g:fieldValue bean="${cateringInstance}" field="snackPrice"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cateringInstance?.teaBreakPrice}">
				<li class="fieldcontain">
					<span id="teaBreakPrice-label" class="property-label"><g:message code="catering.teaBreakPrice.label" default="Tea Break Price" /></span>
					
						<span class="property-value" aria-labelledby="teaBreakPrice-label"><g:fieldValue bean="${cateringInstance}" field="teaBreakPrice"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:cateringInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${cateringInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
