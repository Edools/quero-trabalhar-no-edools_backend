class User < ActiveRecord::Base
  has_many :schools
  has_many :courses
  has_many :students

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, :encrypted_password, presence: true
  validates_uniqueness_of :email

end
