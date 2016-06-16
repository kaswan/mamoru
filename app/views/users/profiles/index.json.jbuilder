json.array!(@user) do |users_profile|
  json.extract! users_profile, :id
  json.url users_profile_url(users_profile, format: :json)
end
