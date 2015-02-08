###
Handles signin

###

# Get form data on submit
$('button[name="submit"]').submit (event)->
	#check password for same
	pass1 = $('input[name="password"]').val()
	
	if pass1 != pass2
		alert 'Passwords do not match'
		return
	
	#get them all
	inputs = 
		email: $('input[name="email"]').val()
		password: $('input[name="password"]').val()
	
	#check
	if !validInputs inputs
		return
		
	#submit
	$.ajax 
		type: 'POST'
		url: '/signin_post'
		data: inputs
		success: (res)->
			if res.success == true
				alert 'Sign in success! ' + res.message
			else
				alert 'Sign in error! ' + res.message
		error: (err)->
			alert 'Unable to submit!'
	
	
validInputs = (inputs)->
	pattern = new RegExp(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);

	if !inputs.email
		alert "Missing email" 
		return false
	else if !pattern.test inputs.email
		alert "Invalid email"
		return false
	else if !inputs.password
		alert "Missing password"
		return false
		
	return true