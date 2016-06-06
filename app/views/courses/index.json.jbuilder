json.array!(@courses) do |course|
  json.extract! course, :id, :title, :name, :description, :content, :duration, :date_creation, :student_active, :price, :school_id
  json.url course_url(course, format: :json)
end
