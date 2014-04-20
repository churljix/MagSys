json.array!(@invoices) do |invoice|
  json.extract! invoice, :id, :total, :remaining, :date, :due_date, :contract_id, :note
  json.url invoice_url(invoice, format: :json)
end
