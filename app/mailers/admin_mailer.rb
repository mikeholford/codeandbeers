class AdminMailer < ApplicationMailer
  	default to: "mike.l.holford@gmail.com"

    def new_user(user)
  		@user = user
  		mail(subject: "New User: #{user.username}")
  	end

end
