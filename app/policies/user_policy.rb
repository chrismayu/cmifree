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


   def stats?
    @current_user.admin? 
   end
   
   def new?
     @current_user.admin?
   end
   
    alias_method :edit?, :admin_or_current_user? 
    alias_method :create?, :admin_or_current_user? 
    alias_method :show?, :admin_or_current_user? 
    alias_method :update?, :admin_only?
    alias_method :destroy?, :admin_only?
    
 

 end
