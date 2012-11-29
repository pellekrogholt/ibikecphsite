class IBikeCPH.Views.Sidebar extends Backbone.View

	events:
		'change .address input'        : 'fields_updated'
		'click .reset'                 : 'reset'
		'click input.link'             : 'select_all'
		'change input.link'            : 'waypoints_changed'
		'click .fold'                  : 'fold'
		'click .details'	             : 'details'
		'change .departure'	  		     : 'change_departure'
		'change .arrival'	   		       : 'change_arrival'
		'click #instructons .step'	   : 'zoom_to_instruction'


	initialize: (options) ->
		Backbone.View.prototype.initialize.apply this, options
		@router = options.router
		
		@model.waypoints.on 'from:change:address to:change:address reset', (model, address) =>
			@set_field model.get('type'), address
		@model.waypoints.on 'from:change:loading to:change:loading reset', (model, loading) =>
			@set_loading model.get('type'), loading

		@model.waypoints.on 'clear:from reset', =>
			@set_field 'from', ''
		@model.waypoints.on 'clear:to reset', =>
			@set_field 'to', ''

		@model.waypoints.on 'reset change', =>
			@waypoints_changed()

		@model.summary.on 'change', @update_departure_arrival, this

	details: (event) =>
		if $('#instructions').is(':visible')
			@hide_instructions()
		else
			@show_instructions()

	show_instructions: ->
		@router.instructions.render()
		$('#instructions').show()
	
	hide_instructions: ->
		$('#instructions').hide()
			
	zoom_to_instruction: (event) ->
		path = _.find @router.map.map._layers, (layer) ->
			if layer._latlngs?
				return true
		point = path._latlngs[ $(event.target).attr('data-index') ]
		@router.map.go_to_point point
	
	parse_time: (str) ->
		hours_mins = str.split /[:\.]/
		if hours_mins.length is 2
			time = new Date()
			time.setHours hours_mins[0]
			time.setMinutes hours_mins[1]
			time
	
	format_time: (time) ->
		('0' + time.getHours()).slice(-2) + ':' + ('0' + time.getMinutes()).slice(-2) if time
		
	change_arrival: (event) ->
		time = @parse_time $(event.target).val()
		@arrival = @format_time time
		@departure = null if time
		$(event.target).val(@arrival)

	change_departure: (event) ->
		time = @parse_time $(event.target).val()
		@departure = @format_time time
		@arrival = null if time
		$(event.target).val(@departure)

	help: (event) ->
		$('#help').toggle()

	fold: (event) ->
		$(@el).toggleClass('hidden')
	
	select_all: (event) ->
		$(event.target).select()

	reset: ->
		@model.reset()
		
	waypoints_changed: ->
		$('IBikeCPH.Collections.Waypoints').hide()
		return if @router.map.dragging_pin
		#$('IBikeCPH.Collections.Waypoints').remove()
		if @model.instructions.length
			url = "#{window.location.protocol}//#{window.location.host}/#!/#{@model.waypoints.to_code()}"
			$('a.permalink').attr href : url
		else
			$('a.permalink').attr href : '#'
			#$('#summary').hide()
			#$('IBikeCPH.Collections.Waypoints').hide()

	update_departure_arrival: ->
		meters = @router.search.summary.get 'total_distance'
		seconds  = @router.search.summary.get 'total_time'

		if meters and seconds
			d = new Date
			d.setSeconds 0	#avoid times that are off by one, due to seconds

			departure = $(".departure input").val()
			arrival   = $(".arrival input").val()

			if not @departure and not @arrival
				now = new Date()
				now.setSeconds 0
				departure = ('0' + now.getHours()).slice(-2) + ':' + ('0' + now.getMinutes()).slice(-2)
				future = new Date()
				future.setTime now.getTime() + seconds * 1000
				arrival = ('0' + future.getHours()).slice(-2) + ':' + ('0' + future.getMinutes()).slice(-2)
		
			if @departure and not @arrival
				departure = @departure
				future = new Date()
				future.setHours departure.split(":")[0]
				future.setMinutes departure.split(":")[1]
				future.setTime future.getTime() + seconds * 1000
				arrival = ('0' + future.getHours()).slice(-2) + ':' + ('0' + future.getMinutes()).slice(-2)

			if @arrival and not @departure
				arrival = @arrival
				past = new Date()
				past.setHours arrival.split(":")[0]
				past.setMinutes arrival.split(":")[1]
				past.setTime past.getTime() - seconds * 1000
				departure = ('0' + past.getHours()).slice(-2) + ':' + ('0' + past.getMinutes()).slice(-2)

			$(".departure").val(departure)
			$(".arrival").val(arrival)
		else
			$(".departure").val('')
			$(".arrival").val('')

	get_field: (field_name) ->
		return @$("input.#{field_name}").val() or ''

	set_field: (field_name, text) ->
		#hide/show clear buttons
		if(text)
			@$("p.#{field_name}").show()
		else
			@$("p.#{field_name}").hide()

		@$(".#{field_name}").val "#{text}"

	set_loading: (field_name, loading) ->
		@$(".#{field_name}").toggleClass 'loading', !!loading

	fields_updated: (event) ->
		input = $(event.target)

		if input.is '.from'
			type = 'from'
		else if input.is '.to'
			type = 'to'
		else
			return
		
		raw_value = input.val()
		value = IBikeCPH.util.normalize_whitespace raw_value
		
		#be a little smarter when parsing adresses, to make nominatim happier
		value = value.replace /\b[kK][bB][hH]\b/g, "København"		# kbh -> København
		value = value.replace /\b[nNøØsSvV]$/, ""					# remove north/south/east/west postfix
		value = value.replace /(\d+)\s+(\d+)/, "$1, $2"				# add comma between street nr and zip code
		
		input.val(value) if value != raw_value

		if value
			#TODO @model.endpoint(type).set 'address', value
		else
			@model.clear type