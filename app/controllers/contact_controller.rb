class ContactController < ApplicationController

  def new
    @captcha = Captcha.new
    @message = Message.new
  end

  def create
    @captcha = Captcha.decrypt(params[:captcha_secret])
    @message = Message.new(params[:message])
    unless @captcha.correct?(params[:captcha])
       respond_to do |format|
      flash.now[:alert] = "Please make sure you entered correct value for captcha."
      @captcha = Captcha.new
       @message = Message.new
      format.html { render action: "new" } 
      format.json { render json: @message.errors, status: :unprocessable_entity }
        end
    else
      respond_to do |format|
           if @message.valid?
              ContactsMailer.notify(@message).deliver
             format.html {redirect_to(root_path, :notice => "Your message was successfully sent.")}
           else
              
             format.html { render action: "new" } 
             format.json { render json: @message.errors, status: :unprocessable_entity }
           end
         end
    end
  
  
  
  
  end
end