class SchoolForm
  include ActiveModel::Model
  include Virtus.model

  attr_reader :school

  attribute :id, Integer
  attribute :name, String
  attribute :pitch, String
  attribute :subdomain, String

  validates :name, presence: true
  validates :subdomain, presence: true, format: {with: /\A[a-z\d]+(-[a-z\d]+)*\z/i}

  def initialize(attr = {})
    @school = School.find(attr['id']) if attr['id'].present?
    super(attr)
  end

  def persisted?
    @school.nil? ? false : @school.persisted?
  end

  def save
    if valid?
      create_school
    end
  rescue ActiveRecord::RecordNotUnique
    errors.add(:subdomain, 'ja foi criado.')
  end

  def update
    if valid?
      update_school
    end
  end

  private

  def create_school
    School.create(name: name, pitch: pitch, subdomain: subdomain)
  end

  def update_school
    @school.update(self)
  end

end
