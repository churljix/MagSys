json.array!(@contracts) do |contract|
  json.extract! contract, :id, :agency_id, :date, :discount, :notes, :last_updated_by
  json.url contract_url(contract, format: :json)
end
