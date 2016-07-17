class ApplicationController < ActionController::Base
  include Pundit 
  include UrlHelper 
  helper UrlHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
 # after_filter :store_location

  def store_location
    # store last url - this is needed for post-login redirect to whatever the user last visited.
    return unless request.get? 
    if (request.path != "/users/sign_in" &&
        request.path != "/users/sign_up" &&
        request.path != "/users/password/new" &&
        request.path != "/users/password/edit" &&
        request.path != "/users/confirmation" &&
        request.path != "/users/sign_out" &&
        !request.xhr?) # don't store ajax calls
      session[:previous_url] = request.fullpath 
    end
  end

  def after_sign_in_path_for(resource)
   root_path
  end
  
  protected

  def set_set_tenant  
    @tenant = User.get_name
    @church_name = User.get_church
  
  end
  
  private
  
  def user_not_authorized
    flash[:alert] = "Access denied."
    unless request.fullpath == root_path
        redirect_to root_path  
       end
    
 
  end
  
end
