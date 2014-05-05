json.array!(@users) do |user|
  json.extract! user, :id, :username, :name, :last_name, :email, :phone, :agency_id
  json.url user_url(user, format: :json)
end
