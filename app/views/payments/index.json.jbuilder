json.array!(@payments) do |payment|
  json.extract! payment, :id, :invoice_id, :amount, :date
  json.url payment_url(payment, format: :json)
end
