class Curso < ApplicationRecord
  belongs_to :escola
  has_and_belongs_to_many :alunos
end
