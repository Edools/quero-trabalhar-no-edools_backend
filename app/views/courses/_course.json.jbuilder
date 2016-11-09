json.extract! course, :id, :title, :school_id, :description, :content, :duration, :active_students, :price, :created_at, :updated_at
json.url course_url(course, format: :json)