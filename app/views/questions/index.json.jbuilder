json.array!(@questions) do |question|
  json.extract! question, :id, :last_name, :first_name, :middle_initial, :address, :city, :postal_code, :phone_number, :email_address
  json.url question_url(question, format: :json)
end
