class School < ActiveRecord::Base
  has_many :courses, dependent: :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :name,        presence: true, length: { maximum: 60 }
  validates :owner_email, presence: true, length: { maximum: 255 },
                          format: { with: VALID_EMAIL_REGEX }
  validate  :edools_subdomain

  private

  def edools_subdomain
    unless !subdomain.blank? && subdomain.end_with?('.edools.com')
      errors.add(:subdomain, 'não pode estar fora do domínio da Edools')
    end
  end
end
