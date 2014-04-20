json.array!(@orders) do |order|
  json.extract! order, :id, :issue_id, :field_id, :client_id, :user_id, :contract_id, :title, :notes, :total_amount, :remaining, :special
  json.url order_url(order, format: :json)
end
