class UserMailer < ApplicationMailer
  	def mandrill_client
  		@mandrill_client ||= Mandrill::API.new MANDRILL_API_KEY
  	end

  	def new_user_welcome(user)
	  	template_name = "new-user-welcome"
	  	template_content = []
	  	message = {
	  		to: [{email: user.email}],
	  		subject: "Welcome to the community!",
	  		merge_vars: [
	  			{rcpt: user.email, 
	  			vars: [
	  				{name: "USER_USERNAME", content: user.username},
	  			]
	  			}
	  		]
	  	}

	  	mandrill_client.messages.send_template template_name, template_content, message
	end 
end
