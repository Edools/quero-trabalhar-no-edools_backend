json.array!(@schools) do |school|
  json.id          school.id
  json.name        school.name
  json.owner_email school.owner_email
  json.pitch       school.pitch
  json.subdomain   school.subdomain
  json.created_at  school.created_at
  json.updated_at  school.updated_at
end
