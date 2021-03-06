class AdminMailer < ApplicationMailer
  	default to: "admin@codeandbeers.com"

  	def mandrill_client
  		@mandrill_client ||= Mandrill::API.new MANDRILL_API_KEY
  	end

    def new_user(user)
  		@user = user
  		mail(subject: "New User: #{user.username}")
  	end

  	def new_resource(resource)
	  	template_name = "admin-new-resource"
	  	template_content = []
	  	message = {
	  		to: [{email: "admin@codeandbeers.com"}],
	  		subject: "New Resource: #{resource.name}",
	  		merge_vars: [
	  			{rcpt: "admin@codeandbeers.com", 
	  			vars: [
	  				{name: "RESOURCE_USER", content: User.find(resource.user_id).username},
	  				{name: "RESOURCE_NAME", content: resource.name},
	  				{name: "RESOURCE_LINK", content: resource.link},
	  			]
	  			}
	  		]
	  	}

	  	mandrill_client.messages.send_template template_name, template_content, message
	end 
end
