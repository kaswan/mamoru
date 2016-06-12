json.array!(@study_courses) do |study_course|
  json.extract! study_course, :id, :name, :summary, :is_free, :price
  json.url admins_study_course_url(study_course, format: :json)
end
