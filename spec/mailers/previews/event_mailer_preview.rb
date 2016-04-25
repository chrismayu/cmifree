# Preview all emails at http://localhost:3000/rails/mailers/event_mailer
class EventMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/event_mailer/event_submission_received
  def event_submission_received
    EventMailer.event_submission_received
  end

  # Preview this email at http://localhost:3000/rails/mailers/event_mailer/event_request
  def event_request
    EventMailer.event_request
  end

end
