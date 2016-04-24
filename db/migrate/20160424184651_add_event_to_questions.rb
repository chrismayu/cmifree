class AddEventToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :full_name, :string
    add_column :questions, :event_name, :string
    add_column :questions, :event_description, :text
    add_column :questions, :event_date, :date
    add_column :questions, :start_time, :date
    add_column :questions, :end_time, :date
    add_column :questions, :taking_place, :string
    add_column :questions, :taking_place_where, :string
    add_column :questions, :registration_required, :boolean,  default: false
  end
end
