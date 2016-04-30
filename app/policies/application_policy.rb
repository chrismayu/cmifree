class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  def admin_or_current_user? 
     admin_or_current_user_private?
  end
   
   
   


  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
  
  
  private
 
 def admin_or_current_user_private? 
    @user.try(:admin?) || @user.id == @record.user_id 
 end
 
 def current_user_with_volunteer?   
   @user.try(:volunteer?)  
 end
 
 def allowed_admins_site_editable?
   @user.try(:admin?) && @user.edit_site?
 end
 
 def allowed_editor_site_editable?
   @user.try(:editor?)  && @user.edit_site?
 end
 
 
 def allowed_admins?
   @user.try(:admin?)  
 end
 
 def allowed_editor?
   @user.try(:editor?) 
 end
 
 
 def allowed_member? 
   @user.try(:member?)
 end
 
 def global_admin?
   user.has_role?('Global Admin')
 end

 def hr_user?
   user.has_role('HR Admin') 
 end
end
