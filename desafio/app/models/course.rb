class Course < ApplicationRecord
  belongs_to :school, inverse_of: :courses

  validates_length_of :titulo, minimum: 5, maximum: 50, allow_blank: false
  validates :titulo, :descricao, :duracao, :data_criacao, :alunos_ativos,:preco, presence: true
end
