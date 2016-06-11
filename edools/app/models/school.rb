class School < ActiveRecord::Base
  validates :name, :email , :pitch, :subdomain, presence: true
  has_many :courses

  private
  def self.search(search)
    if search
      where("name LIKE ?" , "%#{search}%")
    else
      all
    end
  end
end
