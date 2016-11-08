class CourseSerializer < BaseSerializer
  attributes :id, :title, :school_id, :description, :content, :duration, :creation_date, :active_students, :price

  attribute :creation_date do
    object.created_at.to_s
  end

  attribute :created_at do
    object.created_at.to_s
  end

  attribute :updated_at do
    object.created_at.to_s
  end
end
