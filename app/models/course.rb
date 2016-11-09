class Course < ApplicationRecord
  belongs_to :school
  
  def self.search(search)
    if search
      where("title LIKE ?", "%#{search}%")
    else  
      all
    end
  end
end
