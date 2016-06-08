class Course < ActiveRecord::Base
  belongs_to :school

  validates_presence_of :title, message: "Campo não pode ficar em branco"
  validates_presence_of :description, message: "Campo não pode ficar em branco"
  validates_presence_of :content, message: "Campo não pode ficar em branco"
  validates_presence_of :duration, message: "Campo não pode ficar em branco"
  validates_presence_of :price, message: "Campo não pode ficar em branco"
  validates_presence_of :school_id
end
