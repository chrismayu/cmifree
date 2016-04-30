class UsersMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.users_mailer.welcome.subject
  #
  def welcome(event, tenant)
 
    @new_user = event
    @tenant = tenant
 
    mail to: event.email_address,  subject: "Welcome to CMIForms.com"
  end
end
