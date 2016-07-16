class AddAddressToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :taking_place_address, :string
  end
end
