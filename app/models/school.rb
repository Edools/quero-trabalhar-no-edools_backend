class School < ActiveRecord::Base
  has_many :courses

  validates :name, presence: true
  validates :email, presence: true, format: { with: /@/ }
  validates :subdomain, presence: true, format: { with: /\A[a-z0-9.-_]+\Z/ }, uniqueness: true
  validates :creation_date, presence: true

  scope :search_by_name, -> (name) { where("name ILIKE ?", "%#{name}%".gsub(' ','%')) } 

  def active_students
    courses.pluck(:active_students).sum
  end

end
