ActionMailer::Base.smtp_settings = {
  port: 587,
  address: 'smtp.mailgun.org',
  user_name: ENV['MAILGUN_SMTP_LOGIN'],
  password: ENV['MAILGUN_SMTP_PASSWORD'],
  domain: 'https://whispering-gorge-44156.herokuapp.com',
  authentication: :plain,
  content_type: 'text/html'
}

ActionMailer::Base.delivery_method = :smtp

ActionMailer::Base.raise_delivery_errors = true

# This interceptor just makes sure that local mail only emails the developer.
# http://edgeguides.rubyonrails.org/action_mailer_basics.html#intercepting-emails

class DevelopmentMailInterceptor

  def self.delivering_email(message)
    message.to = 'davefogo@gmail.com'

    message.cc = nil

    message.bcc = nil

  end

  # Locally, outgoing mail will be 'intercepted' by the above DevelopmentMailInterceptor before going out

  if Rails.env.development?

  end

end
