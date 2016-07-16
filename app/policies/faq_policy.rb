class FaqPolicy < ApplicationPolicy
   
  alias_method :admin?, :allowed_site_admins? 
 
  alias_method :editor?, :allowed_site_editor? 
 
  alias_method :show?, :allowed_organizer? 
  alias_method :create?, :allowed_organizer? 
  alias_method :new?, :allowed_organizer?  
  alias_method :update?, :allowed_organizer? 
  alias_method :index?, :allowed_organizer? 
  alias_method :edit?, :allowed_organizer? 
  alias_method :destroy?, :allowed_organizer? 


end
