class EventMailer < ApplicationMailer

 
  def event_submission_received(event, tenant)
    @event_submission = event
    @tenant = tenant
    mail to: event.email_address,  subject: "CMIForms - Event Submission Received"
    
  end

 
  def event_request(event, user)
    @event_submission = event
    mail to: user.first.email,  subject: "Event Request - #{event.event_name}"
  end
end
