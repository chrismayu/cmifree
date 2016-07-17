class RegistrationsController < Devise::RegistrationsController
  
  def sign_up_params
     params.require(:user).permit( :subdomain, :email, :first_name, :last_name, :church_name, :how_did_you_hear , :how_did_you_hear_other, :password, :password_confirmation)
  end
 
  def account_update_params
     params.require(:user).permit(:current_password, :email, :first_name, :last_name, :church_name, :password, :password_confirmation)
  end
 
   
 
 
end

