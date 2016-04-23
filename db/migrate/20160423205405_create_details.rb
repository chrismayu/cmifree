class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.string :church_name
      t.string :event_name
      t.string :title
      t.string :top_comment
      t.text :notes
      t.integer :user_id, null: false
      t.boolean :premium,         default: false
      t.string :image_data
      t.date :remove_date
      t.boolean :disable,         default: false

      t.timestamps null: false
    end
  end
end
