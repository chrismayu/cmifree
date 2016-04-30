class UsersMailer < ApplicationMailer

  def welcome(user)
    @user = user
    mail to: user.email,  subject: "Welcome to CMIForms.com"
  end
end
