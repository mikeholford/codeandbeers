class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@codeandbeers.com"
  layout 'mailer'
end
