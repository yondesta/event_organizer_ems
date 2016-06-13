<%@ page import="et.resources.Catering" %>

<div class="row">
	<div class="col-lg-4">
		<div class="form-group ${hasErrors(bean: cateringInstance, field: 'name', 'has-error')} required">
			<label class="control-label" for="name">Name
				<span class="required-indicator">*</span>
			</label>
		<g:textField class="form-control" name="name" required="" value="${cateringInstance?.name}"/>
	</div></div>
	<div class="col-lg-4">
		<div class="form-group ${hasErrors(bean: cateringInstance, field: 'description', 'has-error')} required">
			<label class="control-label" for="description">Description
				<span class="required-indicator">*</span>
			</label>
		<g:textField class="form-control" name="phone" required="" value="${cateringInstance?.phone}"/>
		</div></div></div>
	<div class="row">
		<div class="col-lg-4">
		<div class="form-group ${hasErrors(bean: cateringInstance, field: 'phone', 'has-error')} required">
			<label class="control-label" for="description">Phone
				<span class="required-indicator">*</span>
			</label>
		<g:textField class="form-control" name="phone" required="" value="${cateringInstance?.phone}"/>
		</div></div>
		<div class="col-lg-4">
		<div class="form-group ${hasErrors(bean: cateringInstance, field: 'email', 'has-error')} required">
			<label class="control-label" for="email">Email
				<span class="required-indicator">*</span>
			</label>
		<g:textField class="form-control" name="email" required="" value="${cateringInstance?.email}"/>
		</div></div></div>
	<div class="row">
		<div class="col-lg-4">
		<div class="form-group ${hasErrors(bean: cateringInstance, field: 'teaBreakPrice', 'has-error')} required">
			<label class="control-label" for="teaBreaPrice">Tea Break Price
				<span class="required-indicator">*</span>
			</label>
		<g:textField class="form-control" name="teaBreakPrice" required="" value="${cateringInstance?.teaBreakPrice}"/>
		</div></div>
		<div class="col-lg-4">
		<div class="form-group ${hasErrors(bean: cateringInstance, field: 'lunchPrice', 'has-error')} required">
			<label class="control-label" for="lunchPrice">Lunch Price
				<span class="required-indicator">*</span>
			</label>
		<g:textField class="form-control" name="lunchPrice" required="" value="${cateringInstance?.lunchPrice}"/>
		</div></div></div>
	<div class="row">
		<div class="col-lg-4">
		<div class="form-group ${hasErrors(bean: cateringInstance, field: 'snackPrice', 'has-error')} required">
			<label class="control-label" for="snackPrice">Snack Price
				<span class="required-indicator">*</span>
			</label>
		<g:textField class="form-control" name="snackPrice" required="" value="${cateringInstance?.snackPrice}"/>
		</div></div></div>
