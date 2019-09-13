# frozen_string_literal: true

class Course < ApplicationRecord
  belongs_to :school
  has_many :matriculations

  scope :filter_by_title, lambda { |title|
    where('title LIKE ?', "%#{title}%") if title.present?
  }

  scope :filter_by_school_id, lambda { |school_id|
    where(school_id: school_id) if school_id.present?
  }

  validates :title, presence: true
  validates :description, presence: true
  validates :content, presence: true
  validates :duration, numericality: { only_integer: true }, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0, less_than: 10**6 }
end
