class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
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
