class AddRegToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :registration_required_where, :string
  end
end
