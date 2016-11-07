json.array!(@courses) do |course|
  json.extract! course, :id, :title, :description, :duration, :price, :school_id
  json.url course_url(course, format: :json)
end
