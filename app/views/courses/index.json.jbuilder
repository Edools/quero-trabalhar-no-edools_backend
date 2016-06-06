json.array!(@courses) do |course|
  json.extract! course, :id, :title, :school_id, :description, :content, :duration, :creation_date, :active_students, :price
  json.url course_url(course, format: :json)
end
