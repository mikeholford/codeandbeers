MANDRILL_API_KEY = "yj0p2Me7RPF65YbRuAKjgQ"

ActionMailer::Base.smtp_settings= {
	address: "smtp.mandrillapp.com",
	port: 587,
	enable_starttls_auto: true,
	user_name: "mike.l.holford+codeandbeers@gmail.com",
	password: MANDRILL_API_KEY,
	authentication: "login"
}

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default charset: "utf-8"
