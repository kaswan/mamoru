json.array!(@posts) do |users_post|
  json.extract! users_post, :id
  json.url post_url(users_post, format: :json)
end
