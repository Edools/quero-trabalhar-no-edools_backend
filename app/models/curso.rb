class Curso < ActiveRecord::Base
  belongs_to :escola
  has_many :alunos_ativos
end
