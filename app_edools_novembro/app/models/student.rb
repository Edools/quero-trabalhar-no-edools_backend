class Student < ActiveRecord::Base
  belongs_to :course
  belongs_to :school

  require "validates_cpf_cnpj"

  validates :name, :address, :document, :phone, :responsible, :registration,
            :status_student, :course_id, presence: true
  validates_cpf :document
end
