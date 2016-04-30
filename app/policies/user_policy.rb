class UserPolicy < ApplicationPolicy
  attr_reader :current_user, :model

   def initialize(current_user, model)
     @current_user = current_user
     @user = model
   end
   
   def not_applied?
     @current_user.admin?
   end
   
   def index?
     @current_user.admin?
   end
   def index_import?
     @current_user.admin?
   end

   def all_applicant_new?
    @current_user.admin? 
   end   
   def all_applicant?
    @current_user.admin? 
   end
   
   def generate_new_password_email?
     @current_user.admin?
   end 
   def all_confirmed?
     @current_user.admin?
   end         
   def attachment?
     @current_user.admin?  
   end
   
   def anita?
     @current_user.admin?
   end     
   def flights?
     @current_user.admin?
   end
 
   def medical?
     @current_user.admin?  
   end
 
   def insurance?
    @current_user.admin? 
   end
   
   def new?
     @current_user.admin?
   end
   
    alias_method :edit?, :admin_or_current_user? 
    alias_method :create?, :admin_or_current_user? 
    alias_method :show?, :admin_or_current_user? 
    alias_method :update?, :admin_or_current_user? 
    alias_method :destroy?, :admin_or_current_user? 
    
 

 end
