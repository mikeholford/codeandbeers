class AdminMailer < ApplicationMailer
  	default to: "mike.l.holford@gmail.com"

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
	  		to: [{email: "mike.l.holford@gmail.com"}],
	  		subject: "New Resource: #{resource.name}",
	  		merge_vars: [
	  			{rcpt: "mike.l.holford@gmail.com", 
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
