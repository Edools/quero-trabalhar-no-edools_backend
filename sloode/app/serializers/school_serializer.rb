class SchoolSerializer < BaseSerializer
  attributes :id, :name, :email, :pitch, :subdomain

  attribute :active_students do
    SchoolRepository.get_active_students(object.id)
  end

  attribute :created_at do
    object.created_at.to_s
  end

  attribute :updated_at do
    object.created_at.to_s
  end
end
