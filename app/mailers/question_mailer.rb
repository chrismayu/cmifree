class QuestionMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.question.trial_email.subject
  #
  def trial_email(trial)
    @trial = trial
    mail to: trial.email_address,  subject: "CMIForms - Event Submission Received"
  end
end
