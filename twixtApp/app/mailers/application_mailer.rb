class ApplicationMailer < ActionMailer::Base
  # development settings
  # will need to change to production settings later
  default from: "from@example.com"
  default_url_options[:host] = "localhost:3000"
  layout 'mailer'
end
