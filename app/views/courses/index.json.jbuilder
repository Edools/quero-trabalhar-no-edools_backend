json.array!(@courses) do |course|
  json.id          course.id
  json.title       course.title
  json.description course.description
  json.content     course.content
  json.duration    course.duration
  json.amount      course.amount
  json.created_at  course.created_at
  json.updated_at  course.updated_at
  json.school do
    json.id   course.school.id
    json.name course.school.name
  end
end
