json.array!(@issues) do |issue|
  json.extract! issue, :id, :magazine_id, :number, :date, :due_date, :status
  json.url issue_url(issue, format: :json)
end
