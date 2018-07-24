json.extract! course, :id, :title, :school_id, :description, :content, :start_date, :end_date, :price, :created_at, :updated_at
json.url course_url(course, format: :json)
