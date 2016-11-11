class Aluno < ActiveRecord::Base
  belongs_to :escola
  has_and_belongs_to_many :cursos
  validates :nome, presence: { message: "obrigatório" }, uniqueness: true
end
