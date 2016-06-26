json.array!(@admins_schedules) do |admins_schedule|
  json.extract! admins_schedule, :id, :start_date
  json.url admins_schedule_url(admins_schedule, format: :json)
end
