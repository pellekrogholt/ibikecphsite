class ibikecph.Geocoder

	constructor: (@model) ->
		@current =
			address: null
			location:
				lat: null
				lng: null

		@request = null

		@model.bind 'change:address', =>
			@load_address @model.get 'address'

		@model.bind 'change:location', =>
			location = @model.get 'location'

			@abort()
			@wait_for 300, =>
				@load_location @model.get 'location'

	wait_for: (milliseconds, callback) ->
		clearTimeout(@timer) if @timer
		@timer = setTimeout callback, milliseconds

	abort: ->
		@request.abort() if @request?.abort

	request_init: ->
		@abort()
		@model.set 'loading', true

	request_done: ->
		@request = null
		@model.set 'loading', false

	convert_number: (value) ->
		value = 1 * value
		if isNaN value
			null
		else
			value

	load_address: (new_address) ->
		console.log "load_adresss"
		#return if new_address == @current.address
		@current.address = new_address
		
		#unless @current.address
		#	@current.location.lat = null
		#	@current.location.lng = null
		#	@model.set 'location', @current.location
		#	@model.trigger 'change:location', @model, @current.location, {}
		#	@model.trigger 'change', @model
		#	return
		
		console.log new_address
		pattern = /(.+?)(\s+(\w*))?,\s*(\d+)\s*/
		result = pattern.exec new_address
		if result
			console.log 'regex OK'
			#console.log result
			options = {
			 	vejnavn: result[1],
				husnr: result[3],
				postnr: result[4]
			}

			@request_init()
			$.ajax 'http://geo.oiorest.dk/adresser.json',
				type: 'GET'
				dataType: 'jsonp'
				data: options
				cache: true
				success: (data, textStatus, jqXHR) =>
					if data && data[0]
						@current.location.lat = @convert_number data[0].wgs84koordinat.bredde
						@current.location.lng = @convert_number data[0].wgs84koordinat.længde
						@model.set 'location', @current.location
						@model.trigger 'change:location', @model, @current.location, {}
						@model.trigger 'change', @model
					@request_done()

	load_location: (new_location) ->
		return
		console.log "load_location"
		return if new_location?.lat == @current.location.lat and new_location?.lng == @current.location.lng

		@current.location.lat = new_location?.lat
		@current.location.lng = new_location?.lng

		return unless @current.location.lat and @current.location.lng

		@request_init()

		options = _.extend
			format : 'json'
			lat    : @current.location.lat or 0
			lon    : @current.location.lng or 0
		, ibikecph.config.geocoding_service.options

		@request = $.getJSON ibikecph.config.reverse_geocoding_service.url + '?json_callback=?', options, (result) =>
			@request_done()

			address = ibikecph.util.displayable_address result

			if address
				@current.address = address
				@model.set 'address', @current.address
