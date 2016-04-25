class EventMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.event_mailer.event_submission_received.subject
  #
  default from: ENV["SITE_EMAIL"]
  def event_submission_received(event)
 
    @event_submission = event
 
    mail to: event.email_address,  subject: "CMIForms - Event Submission Received"
    
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.event_mailer.event_request.subject
  #
  def event_request(event, user)
 
    @event_submission = event
 
    mail to: user.first.email,  subject: "Event Request - #{event.event_name}"
  end
end
