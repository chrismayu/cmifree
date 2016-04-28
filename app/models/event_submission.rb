class EventSubmission < ActiveRecord::Base
  
  validates_format_of :email_address, :with => /.+@.+\..+/i
  validates :full_name, length: { maximum: 200 },  :presence => true
  validates :event_name, length: { maximum: 200 },  :presence => true
  validates :event_description, :presence => true
  validates :event_date, :presence => true
  validates :start_time, :presence => true
  validates :end_time, :presence => true
  validates :taking_place, :presence => true
  validates_presence_of :taking_place_where, :if => :taking_place_somewhere?
  validates :how_to_market, length: { maximum: 700 },  :presence => true
  
 
  def taking_place_somewhere?
    taking_place == "At Our Church"
  end

  
end
