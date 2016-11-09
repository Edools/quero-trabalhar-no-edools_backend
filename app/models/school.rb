class School < ApplicationRecord
  has_many :courses
  
  validates :name, presence: true
  validates :owner_email, presence: true, email: true
  validates :subdomain, exclusion: { in: %w(www app application aplicativo sistema blog teste test),
    message: "%{value} is reserved." }, uniqueness: true
  
  def self.search(search)
    if search
      where("name LIKE ?", "%#{search}%")
    else  
      all
    end
  end
end
