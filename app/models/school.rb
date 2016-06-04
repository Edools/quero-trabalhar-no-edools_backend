class School < ActiveRecord::Base
  has_many :courses
  has_many :students, through: :courses
 
  validates :name, presence: true
  validates :email, presence: true
  validates :subdomain, presence: true, format: { with: /\A[a-z0-9.-_]+\Z/ }
 
  scope :search_by_name, -> (name) { where("name ILIKE ?", "%#{name}%".gsub(' ','%')) }
end
