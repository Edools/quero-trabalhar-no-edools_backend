class School < ApplicationRecord
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  has_many :courses

  validates_presence_of :name, :owner_email, :subdomain, :creation_date
  validates_uniqueness_of :name, :subdomain
  validates_format_of :subdomain, with: /\A\S*\Z/
  validates_format_of :owner_email, with: EMAIL_REGEX

  scope :by_name, ->(name) { where('name like ?', "%#{name}%") }

  before_destroy :can_be_destroyed?

  private

  def can_be_destroyed?
    if Students.acive_by_school_id(id).present?
      errors.add(:base, 'Existem alunos ativos')
      throw :abort
    end
  end
end
