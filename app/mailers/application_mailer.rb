class ApplicationMailer < ActionMailer::Base
  helper :event_submissions
  default from: ENV["SITE_EMAIL"] 
  layout 'mailer'
end
