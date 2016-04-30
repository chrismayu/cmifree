class DetailPolicy < ApplicationPolicy
  
  def new?
    true
  end
  
  def create?
    true
  end
   
   
  alias_method :edit?, :admin_or_current_user? 
  alias_method :create?, :admin_or_current_user? 
  alias_method :show?, :admin_or_current_user? 
  alias_method :update?, :admin_or_current_user? 
 
 end
