# Any public page

module.exports = (app) ->
	class app.PublicController
		
		@index = (req, res) ->
			res.render 'public/index',
				title: 'Home'
		
		@search = (req, res) ->
			res.render 'public/search',
				title: 'Search for CrowdBox'
		
		@view = (req, res) ->
			res.render 'public/view',
				title: 'View CrowdBox'
				
		@signin = (req, res) ->
			res.render 'public/signin',
				title: 'Sign in'
				
		########################################################		
		@signup = (req, res) ->
			res.render 'public/signup',
				title: 'Sign up'
		
		@signup_post = (req, res) ->
			edisonId = req.body.edison_id
			data = 
				firstName: req.body.first_name
				lastName: req.body.last_name
				email: req.body.email
				password: req.body.password
				location_name: req.body.location_name
			
				#Check if email is user TODO
			console.log JSON.stringify data, undefined, 2
			console.log edisonId
			if data?
				#Get Edison, then creat account with it
				param = 
					where:
						serial: edisonId
					order: '-name'
				app.kaiseki.getObjects 'Edison', param, (err, resp, body, success)->
					console.log resp
					if success
						#make user
						data.edisonId = edisonId
						app.kaiseki.createUser data, (err, resp, body, success)->
							console.log "CALL "+  success
							if success
								res.send 
									success: true
									message: "Account Created!"
							else 
								res.send 
									success: false
									message: "Problem creating account!"
							return
					else
						res.send 
							success: false
							message: " Invalid Serial Number " 
					return
			else
				res.send 
					success: false
					message: "Validation errors: " + util.inspect(errors)
			return