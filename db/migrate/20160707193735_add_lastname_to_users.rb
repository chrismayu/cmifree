class AddLastnameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :church_name, :string
    add_column :users, :how_did_you_hear, :string
    add_column :users, :how_did_you_hear_other, :string
  end
end
