json.array!(@users_study_courses) do |users_study_course|
  json.extract! users_study_course, :id
  json.url users_study_course_url(users_study_course, format: :json)
end
