<%@ page import="et.resources.Catering" %>



<div class="fieldcontain ${hasErrors(bean: cateringInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="catering.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${cateringInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cateringInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="catering.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${cateringInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cateringInstance, field: 'lunchPrice', 'error')} required">
	<label for="lunchPrice">
		<g:message code="catering.lunchPrice.label" default="Lunch Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="lunchPrice" value="${fieldValue(bean: cateringInstance, field: 'lunchPrice')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: cateringInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="catering.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${cateringInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cateringInstance, field: 'phone', 'error')} required">
	<label for="phone">
		<g:message code="catering.phone.label" default="Phone" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="phone" required="" value="${cateringInstance?.phone}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cateringInstance, field: 'snackPrice', 'error')} required">
	<label for="snackPrice">
		<g:message code="catering.snackPrice.label" default="Snack Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="snackPrice" value="${fieldValue(bean: cateringInstance, field: 'snackPrice')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: cateringInstance, field: 'teaBreakPrice', 'error')} required">
	<label for="teaBreakPrice">
		<g:message code="catering.teaBreakPrice.label" default="Tea Break Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="teaBreakPrice" value="${fieldValue(bean: cateringInstance, field: 'teaBreakPrice')}" required=""/>

</div>

