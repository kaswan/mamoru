json.array!(@specialist) do |specialists_profile|
  json.extract! specialists_profile, :id, :index, :edit, :update, :destroy
  json.url specialists_profile_url(specialists_profile, format: :json)
end
