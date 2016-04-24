json.array!(@event_submissions) do |event_submission|
  json.extract! event_submission, :id, :full_name, :event_name, :event_description, :event_date, :start_time, :end_time, :taking_place, :taking_place_where, :registration_required, :last_name, :first_name, :middle_initial, :address, :city, :postal_code, :phone_number, :email_address
  json.url event_submission_url(event_submission, format: :json)
end
