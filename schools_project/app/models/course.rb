# frozen_string_literal: true

class Course < ApplicationRecord
  belongs_to :user
  belongs_to :school

  has_many :students, dependent: :destroy

  scope :by_title, ->(title) { where('title like ?', "%#{title}%") }
  scope :by_school, ->(school_id) { where(school_id: school_id) if school_id.present? }

  validates :school, :title, presence: true

  monetize :price_cents
end
