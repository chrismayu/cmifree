class ContactsController < ApplicationController

  def new
    @captcha = Captcha.new
    @message = Message.new
  end

  def create
    @captcha = Captcha.decrypt(params[:captcha_secret])
    @message = Message.new(params[:message])
    unless @captcha.correct?(params[:captcha])
      flash.now[:alert] = "Please make sure you entered correct value for captcha."
      # Here we need to initialize @captcha with new object in order to show 
      # different captcha each time on form 
      @captcha = Captcha.new
      render :new
    else
      ContactsMailer.notify(contact).deliver
      flash[:notice] = "Your message has been sent successfully"
      redirect_to root_path
    end
  end
end