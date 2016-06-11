# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  email      :string           not null
#  birthday   :date             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_students_on_email  (email) UNIQUE
#  index_students_on_name   (name)
#

class Student < ActiveRecord::Base
  validates :name, :email, :birthday, presence: true
  validates :email, uniqueness: { case_sensitive: false },
            format: /\A(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Z‌​a-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6}\z/i

  has_many :enrollments, :dependent => :delete_all
  has_many :courses, through: :enrollments

  searchable do
    text :name, :email
  end
end
