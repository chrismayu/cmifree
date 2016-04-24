module DevisePermittedParameters
  extend ActiveSupport::Concern

  included do
    before_action :configure_permitted_parameters
  end

  protected

  def configure_permitted_parameters_old
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :subdomain])
   devise_parameter_sanitizer.permit(:account_update, keys: [:name, :subdomain]) 
   
   
   
  end
  
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:name, :subdomain, :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit(:name, :subdomain, :email, :password, :password_confirmation)
    end

  end

end

DeviseController.send :include, DevisePermittedParameters
