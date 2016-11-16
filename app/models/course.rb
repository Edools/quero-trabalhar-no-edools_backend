class Course < ActiveRecord::Base
  belongs_to :school

  validates :school_id, presence: true
end
