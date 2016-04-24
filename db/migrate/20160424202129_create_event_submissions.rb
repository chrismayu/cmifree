class CreateEventSubmissions < ActiveRecord::Migration
  def change
    create_table :event_submissions do |t|
      t.string :full_name
      t.string :event_name
      t.text :event_description
      t.date :event_date
      t.time :start_time
      t.time :end_time
      t.string :taking_place
      t.string :taking_place_where
      t.boolean :registration_required, default: false
      t.string :last_name
      t.string :first_name
      t.string :middle_initial
      t.string :address
      t.string :city
      t.string :postal_code
      t.string :phone_number
      t.string :email_address

      t.timestamps null: false
    end
  end
end
