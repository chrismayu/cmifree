class AddRegToEventSubmission < ActiveRecord::Migration
  def change
    add_column :event_submissions, :registration_required_where, :string
  end
end
