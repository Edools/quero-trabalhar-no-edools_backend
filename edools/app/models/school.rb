class School < ActiveRecord::Base
  validates :name, :email , :pitch, :subdomain, presence: true
  has_many :courses
  validates_format_of :subdomain, with: /\A^[-a-z]+$\z/

  private
  def self.search(search)
    if search
      where("name LIKE ?" , "%#{search}%")
    else
      all
    end
  end
end
