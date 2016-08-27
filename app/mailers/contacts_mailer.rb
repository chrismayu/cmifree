class ContactsMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contacts_mailer.notify.subject
  #SITE_EMAIL
  def notify(message)
      @message = message 
      mail  :to => ENV["ADMIN_EMAIL"] , :cc => ENV["ADAM_EMAIL"],  :reply_to => @message.email, subject:  "CMIForms.com || Contact Form #{DateTime.now.strftime("%D at %I:%M%p")}"
        
  end
end
