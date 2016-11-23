class Student < ActiveRecord::Base
  enum status: [ :active, :inactive ]
  has_and_belongs_to_many :courses
  belongs_to :user

  scope :statuses_to_select, -> { self.statuses.keys.map { |status| [status.titleize, status] } }
  scope :with_user, -> (user) { where(user: user).order(:id, :updated_at)  }
end
