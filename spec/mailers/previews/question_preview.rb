# Preview all emails at http://localhost:3000/rails/mailers/question
class QuestionPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/question/trial_email
  def trial_email
    Question.trial_email
  end

end
