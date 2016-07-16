class AddAddressToEventSubmission < ActiveRecord::Migration
  def change
     add_column :event_submissions, :taking_place_address, :string
  end
end
