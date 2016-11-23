class Course < ActiveRecord::Base
  belongs_to :school
  has_many :students, dependent: :restrict_with_error

  validates :title, presence: true
  validates :school, presence: true
  validates :content, presence: true
  validates :duration, presence: true
  validates :price, presence: true

  accepts_nested_attributes_for :students, allow_destroy: true,
                                           reject_if: -> (c) { c[:student_id].empty? }
end
