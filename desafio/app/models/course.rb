class Course < ApplicationRecord
  belongs_to :school, inverse_of: :courses
  scope :titulo, -> (titulo) { where("titulo like ?", "#{titulo}%")}
  scope :nome_escola, ->(nome) {joins(:school).where('nome like ?', "#{nome}%")}
  scope :preco, -> (min,max) { where("preco BETWEEN ? AND ?", "#{min}","#{max}")}

  validates_length_of :titulo, minimum: 5, maximum: 50, allow_blank: false
  validates :titulo, :descricao, :duracao, :data_criacao, :alunos_ativos,:preco, presence: true
end
