class School < ActiveRecord::Base
  has_many :courses, dependent: :destroy
  belongs_to :user

  scope :with_user, -> (user) { where(user: user)  }
end
