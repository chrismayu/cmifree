class VisitorsController < ApplicationController
  def index
    if user_signed_in?
       redirect_to user_detail_url(current_user, current_user.detail) 
    end
    
    unless request.subdomain == "www" or request.subdomain == ""
    redirect_to new_event_submission_url(subdomain: request.subdomain) 
    end
    
      @question = Question.new

  end
end
