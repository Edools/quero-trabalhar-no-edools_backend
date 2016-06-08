class Student < ActiveRecord::Base
  belongs_to :school

  validates_presence_of :name, message: "Campo não pode ficar em branco"
  validates_presence_of :phone, message: "Campo não pode ficar em branco"
  validates_presence_of :document, message: "Campo não pode ficar em branco"
  validates_presence_of :address, message: "Campo não pode ficar em branco"
end
