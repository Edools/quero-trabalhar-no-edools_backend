json.array!(@students) do |student|
  json.id         student.id
  json.name       student.name
  json.address    student.address
  json.phone      student.phone
  json.school_id  student.school_id
  json.ative      student.ative
  json.created_at student.created_at
  json.updated_at student.updated_at
end
