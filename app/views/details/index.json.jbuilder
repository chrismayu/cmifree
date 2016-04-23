json.array!(@details) do |detail|
  json.extract! detail, :id, :church_name, :event_name, :title, :top_comment, :notes, :user_id, :premium, :image_data, :remove_date, :user_id, :disable
  json.url detail_url(detail, format: :json)
end
