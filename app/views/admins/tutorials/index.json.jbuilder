json.array!(@tutorials) do |tutorial|
  json.extract! tutorial, :id, :title, :summary, :is_free
  json.url admins_tutorial_url(tutorial, format: :json)
end
