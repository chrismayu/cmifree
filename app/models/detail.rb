class Detail < ActiveRecord::Base
   belongs_to :user 
   
   
   #:church_name, :event_name, :title, :top_comment, :notes, :user_id, :premium, :image_data, :remove_date, :user_id, :disable
   
   #validates :church_name, :presence => true
  # validates :event_name, :presence => true
  # validates :title, :presence => true
   
end
