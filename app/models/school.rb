class School < ApplicationRecord
  before_save :sanatize_subdomain

  validates_presence_of :name, :owner_email, :subdomain, :pitch
  validates :owner_email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :pitch, format: { with: /\A^(?:https?:\/\/)?(?:www\.)?youtu(?:\.be|be\.com)\/(?:watch\?v=)?([\w-]{10,})\z/ }
  validates :subdomain, format: { with: /\A([a-z][a-z\d]*(-[a-z\d]+)*|xn--[\-a-z\d]+)\z/i }
  validates_uniqueness_of :subdomain, case_sensitive: false

  def sanatize_subdomain
    self.subdomain = self.subdomain.downcase
  end
end
