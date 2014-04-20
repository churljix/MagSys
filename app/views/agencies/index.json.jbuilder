json.array!(@agencies) do |agency|
  json.extract! agency, :id, :title, :reg_number, :address, :phone
  json.url agency_url(agency, format: :json)
end
