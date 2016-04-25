class VisitorsController < ApplicationController
  def index
    if user_signed_in?
       redirect_to user_detail_url(current_user, current_user.detail) 
    end
  end
end
