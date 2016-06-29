json.array!(@specialists) do |specialist|
  json.extract! specialist, :id
  json.url consult_url(specialist, format: :json)
end
