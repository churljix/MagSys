json.array!(@clients) do |client|
  json.extract! client, :id, :title, :reg_number, :phone, :contact, :email
  json.url client_url(client, format: :json)
end
