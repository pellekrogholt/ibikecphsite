noop = -> null # no operation


class ibikecph.SmartJSONP

	constructor: ->
		@current_request = null
		@pending_request = null

	abort: ->
		@current_request.abort() if @current_request?.abort

	exec: (url, data, callback) ->
		return if arguments.length == 0

		if arguments.length == 2
			if typeof data == 'function'
				callback = data
				data     = null

		callback = noop unless typeof callback == 'function'

		if @current_request
			@pending_request =
				url      : url
				data     : data
				callback : callback
			return

		@current_request = $.ajax
			url      : url
			cache    : true # to prevent sending _=[timestamp] query string parameter
			dataType : 'jsonp'
			timeout  : 1000
			success  : (data, status, xhr) =>
				callback data
			error    : (xhr, status, error) =>
				#console.error 'Request failed', status, error, xhr
			complete : (xhr, status) =>
				pending          = @pending_request
				@current_request = null
				@pending_request = null
				if pending
					@exec pending.url, pending.data, pending.callback
