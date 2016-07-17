class Status < Struct.new(:full_name, :email, :subdomain, :count, :date); end

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only, :except => :show

  def index
    @users = User.all
  end
  
  def stats
    users = User.all
    @stat = []
    users.each do |u| 
      stat = Status.new 
      stat.full_name = u.name if !nil
      stat.full_name = u.first_name if !nil
      stat.email = u.email
      stat.subdomain = u.subdomain
      
      Apartment::Tenant.switch(stat.subdomain)  
      stat.count = EventSubmission.all.count
      unless EventSubmission.last == nil
      stat.date = EventSubmission.last.created_at  
      
    end 
      @stat << stat
    end
  
  end
  

  def show
    @user = User.find(current_user.id)
    unless current_user.admin?
      unless @user == current_user
        redirect_to :back, :alert => "Access denied."
      end
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
     Apartment::Tenant.drop(user.subdomain)
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  def admin_only
    unless current_user.admin?
      redirect_to :back, :alert => "Access denied."
    end
  end

  def secure_params
    params.require(:user).permit(:role, :first_name)
  end

end
