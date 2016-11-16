json.extract! course, :id, :title, :description, :content, :duration, :active_students, :price, :created_at, :updated_at
json.url course_url(course, format: :json)
