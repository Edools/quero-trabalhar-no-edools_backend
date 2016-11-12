class Escola < ActiveRecord::Base
  has_many :cursos
  has_many :alunos

  validates :nome, presence: { message: "obrigatório" }
  validates_format_of :sub_dominio, with: /\A[a-zA-Z0-9-]+.edools.com\z/, message: "inválido"
end
