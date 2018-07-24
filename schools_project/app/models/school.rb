class School < ApplicationRecord
  belongs_to :user

  has_many :courses, dependent: :destroy

  validates :name, :pitch, :subdomain, presence: true
end
