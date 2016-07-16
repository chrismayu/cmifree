class CreateFaqs < ActiveRecord::Migration
  def change
    create_table :faqs do |t|
      t.string :title
      t.integer :user_id
      t.boolean :admin,       default: false
      t.boolean :member_only,       default: false
      t.integer :answer
      t.boolean :editor,       default: false
      t.text :the_answer

      t.timestamps null: false
    end
  end
end
