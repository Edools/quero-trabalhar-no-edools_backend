class School < ActiveRecord::Base
  has_many :courses, dependent: :destroy

  validates :name,        presence: true, length: { maximum: 60 }
  validates :owner_email, presence: true
  validate  :edools_subdomain

  private

  def edools_subdomain
    unless !subdomain.blank? && subdomain.end_with?('.edools.com')
      errors.add(:subdomain, 'não pode estar fora do domínio da Edools')
    end
  end
end
