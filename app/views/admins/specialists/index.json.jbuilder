json.array!(@specialists) do |specialist|
  json.extract! specialist, :id
  json.url specialist_url(specialist, format: :json)
end
