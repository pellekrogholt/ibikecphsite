
#add support for maxlength in text-areas, by setting the 'maxlength' attribute.
jQuery.fn.limitMaxlength = (options) ->
	settings = jQuery.extend({
		attribute: "maxlength",
		onLimit: (->),
		onEdit: (->)
	}, options)

	# Event handler to limit the textarea
	onEdit = () ->
		textarea = jQuery(this)
		maxlength = parseInt(textarea.attr(settings.attribute))

		if(textarea.val().length > maxlength)
			textarea.val(textarea.val().substr(0, maxlength))
			# Call the onlimit handler within the scope of the textarea
			jQuery.proxy(settings.onLimit, this)()

		# Call the onEdit handler within the scope of the textarea
		jQuery.proxy(settings.onEdit, this)(maxlength - textarea.val().length)

	this.each onEdit
	return this.keyup(onEdit).keydown(onEdit).focus(onEdit)

#add support for showing maxlength in text-areas, by setting the 'data-maxlength' attribute
jQuery.fn.showMaxlength = (options) ->

	settings = jQuery.extend(
		attribute: "data-maxlength",
		onLimit: -> {},
		onEdit: -> {}
	, options)

	# Event handler to limit the textarea
	onEdit = () ->
		textarea = jQuery(this)
		maxlength = parseInt(textarea.attr(settings.attribute))

		if(textarea.val().length > maxlength)
			# Call the onlimit handler within the scope of the textarea
			jQuery.proxy(settings.onLimit, this)(textarea.val().length - maxlength)

		# Call the onEdit handler within the scope of the textarea
		jQuery.proxy(settings.onEdit, this)(maxlength - textarea.val().length)
	
	this.each onEdit
	return this.keyup(onEdit).keydown(onEdit).focus(onEdit)

jQuery ->
	onEditCallback = (remaining) ->
		if(remaining >= 0)
			$(this).siblings('.chars_remaining').text(' '+I18n.t('character.remaining', n: remaining ))
			$(this).siblings('.chars_remaining').removeClass('too_long')

	onLimitCallback = (excess) ->
		$(this).siblings('.chars_remaining').text(' '+I18n.t('character.too_long', n: excess ))
		$(this).siblings('.chars_remaining').addClass('too_long')

	$('textarea[maxlength]').limitMaxlength(
		onEdit: onEditCallback,
		onLimit: onLimitCallback,
	)

	$('textarea[data-maxlength]').showMaxlength(
		onEdit: onEditCallback,
		onLimit: onLimitCallback,
	)
