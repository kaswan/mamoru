json.array!(@schedules) do |schedule|
  json.extract! schedule, :id
  json.url specialists_schedule_url(schedule, format: :json)
end
