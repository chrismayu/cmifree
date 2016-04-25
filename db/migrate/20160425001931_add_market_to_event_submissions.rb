class AddMarketToEventSubmissions < ActiveRecord::Migration
  def change
    add_column :event_submissions, :how_to_market, :text
  end
end
