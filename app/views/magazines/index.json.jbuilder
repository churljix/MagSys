json.array!(@magazines) do |magazine|
  json.extract! magazine, :id, :title, :issue, :prints, :subscribers, :readership, :picture, :status
  json.url magazine_url(magazine, format: :json)
end
