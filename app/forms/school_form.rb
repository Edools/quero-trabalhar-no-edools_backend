class SchoolForm
  include ActiveModel::Model
  include ActiveModel::Validations
  include Virtus

  attribute :name, String
  attribute :pitch, String
  attribute :subdomain, String

  validates :name, presence: true
  validates :subdomain, presence: true, format: {with: /\A[a-z\d]+(-[a-z\d]+)*\z/i}

  def save
    if valid?
      create_school
    end
  rescue ActiveRecord::RecordNotUnique
    errors.add(:subdomain, 'ja foi criado.')
  end

  private

  def create_school
    School.create(name: name, pitch: pitch, subdomain: subdomain)
  end

end
