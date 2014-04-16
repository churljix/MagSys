json.array!(@fields) do |field|
  json.extract! field, :id, :title, :height, :width, :price
  json.url field_url(field, format: :json)
end
