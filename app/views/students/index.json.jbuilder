json.array!(@students) do |student|
  json.extract! student, :id, :name, :cpf, :age, :school_id
  json.url student_url(student, format: :json)
end
