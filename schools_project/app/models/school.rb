# frozen_string_literal: true

class School < ApplicationRecord
  VALID_SUBDOMAIN_REGEX = /\A([a-z][a-z\d]*(-[a-z\d]+)*|xn--[\-a-z\d]+)\z/i

  belongs_to :user

  has_many :courses, dependent: :destroy

  scope :by_name, ->(name) { where('name like ?', "%#{name}%") }

  validates :name, :pitch, :subdomain, presence: true
  validates :subdomain, uniqueness: true
  validates :subdomain, format: { with: VALID_SUBDOMAIN_REGEX }
end
