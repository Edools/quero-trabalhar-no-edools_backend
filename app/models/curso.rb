class Curso < ActiveRecord::Base
  belongs_to :escola
  has_and_belongs_to_many :alunos

  validates :titulo, presence: { message: "obrigatório" }
  validates :duracao, presence: { message: "obrigatório" }
  validates :preco, presence: { message: "obrigatório" }, numericality: { greater_than_or_equal_to: 0}

end
