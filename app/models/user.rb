class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :schools, dependent: :destroy
  has_many :courses, dependent: :destroy
end
