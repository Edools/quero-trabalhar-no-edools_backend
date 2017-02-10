class Aluno < ActiveRecord::Base
  validates :nome, presence: { message: "obrigatório" }
end
