
#this is needed to avoid ajax calls clearing the session in rails 3
#see http:#weblog.rubyonrails.org/2011/2/8/csrf-protection-bypass-in-ruby-on-rails
$(document).ajaxSend (e, xhr, options) ->
	token = $("meta[name='csrf-token']").attr("content")
	xhr.setRequestHeader("X-CSRF-Token", token)

jQuery ->
	#begin continous updating of 'time ago' labels
	jQuery("span.timeago").timeago()

	#set focus in forms
	$('#focus_input').focus()