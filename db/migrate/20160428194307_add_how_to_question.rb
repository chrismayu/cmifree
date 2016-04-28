class AddHowToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :how_to_market, :text
  end
end
