class Detail < ActiveRecord::Base
   belongs_to :user 
   
   
   #:church_name, :event_name, :title, :top_comment, :notes, :user_id, :premium, :image_data, :remove_date, :user_id, :disable
   
  #validates :church_name, :presence => true
  # validates :event_name, :presence => true
  # validates :title, :presence => true

  scope :submission, -> { select( :church_name) } 
  
  def self.get_tenant
    tenant_name = Apartment::Tenant.current
    user = User.get_tenant_user
    detail = Detail.submission.where(:user_id => user.first.id)
  end


   
end



