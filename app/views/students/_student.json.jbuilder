json.extract! student, :id, :name, :email, :phone, :birthdate, :address_id, :created_at, :updated_at
json.url student_url(student, format: :json)