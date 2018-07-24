class Course < ApplicationRecord
  belongs_to :user
  belongs_to :school

  scope :by_title, -> (title) { where("title like ?", "%#{title}%")}
  scope :by_school, lambda{ |school_id| self.where(school_id: school_id) if school_id.present? }

  validates :school, :title, presence: true

  monetize :price_cents
end
