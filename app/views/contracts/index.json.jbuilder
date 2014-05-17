json.array!(@contracts) do |contract|
  json.extract! contract, :id, :agency_id, :date, :discount, :notes, :user_id
  json.url contract_url(contract, format: :json)
end
