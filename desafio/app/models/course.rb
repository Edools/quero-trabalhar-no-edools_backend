class Course < ApplicationRecord
  validates_length_of :titulo, minimum: 5, maximum: 50, allow_blank: false
  validates :titulo, :escola_id, :descricao, :duracao, :data_criacao, :alunos_ativos,:preco, presence: true
end
