json.array!(@courses) do |course|
  json.extract! course, :id, :title, :description, :content, :duration, :active_students, :price, :school_id
  json.url course_url(course, format: :json)
end
