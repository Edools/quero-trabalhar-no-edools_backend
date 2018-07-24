class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  
  has_many :schools, dependent: :destroy
  has_many :courses, dependent: :destroy
  
  has_many :user_course_registrations, dependent: :destroy
  has_many :courses, through: :user_course_registrations

  attr_accessor :input_roles
  before_create :assign_default_role

  def assign_default_role
    if @input_roles != 'Administrador'
      self.add_role(:standart_user)
    else
      self.add_role(:admin)
    end
  end
end
