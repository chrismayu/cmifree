class AddEmailToDetail < ActiveRecord::Migration
  def change
    add_column :details, :emailed, :boolean, default: false
  end
end
