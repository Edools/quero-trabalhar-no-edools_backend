# frozen_string_literal: true

class School < ApplicationRecord
  belongs_to :owner, class_name: User.to_s
  has_many :courses

  has_many :matriculations, through: :courses
  has_many :users, through: :matriculations

  before_validation :fill_subdomain
  after_create :update_owner

  scope :filter_by_name, lambda { |name|
    where('name LIKE ?', "%#{name}%") if name.present?
  }

  validates :name, uniqueness: true, presence: true
  validates :pitch, presence: true
  validates :subdomain, uniqueness: true, presence: true

  private

  def fill_subdomain
    return if name.blank?

    clear_name = I18n.transliterate(name).gsub(/[^a-zA-Z 0-9]/, '')
    self.subdomain = clear_name.strip.squeeze(' ').downcase.tr(' ', '-')
  end

  def update_owner
    return if owner.owner?

    owner.owner = true
    owner.save!
  end
end
