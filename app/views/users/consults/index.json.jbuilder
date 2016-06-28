json.array!(@users_consults) do |users_consult|
  json.extract! users_consult, :id
  json.url users_consult_url(users_consult, format: :json)
end
