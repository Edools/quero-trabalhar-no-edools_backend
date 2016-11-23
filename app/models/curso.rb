class Curso < ActiveRecord::Base
  belongs_to :escola

  validates :titulo, presence: true
  validates :titulo, length:{minimum: 5}
end
