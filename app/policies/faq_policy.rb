class FaqPolicy < ApplicationPolicy
   
   
  def index?
   true
  end
  
 
  alias_method :show?, :allowed_admins?
  alias_method :admin?, :allowed_admins?
  alias_method :create?, :allowed_admins?
  alias_method :new?, :allowed_admins? 
  alias_method :update?, :allowed_admins? 
  alias_method :edit?, :allowed_admins?
  alias_method :destroy?, :allowed_admins?


end
