json.array!(@messages) do |message|
  json.extract! message, :id, :user_id, :recipient_id, :text, :status, :visible
  json.url message_url(message, format: :json)
end
