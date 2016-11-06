# encoding:utf-8
class Aluno < ApplicationRecord
  has_and_belongs_to_many :cursos
  has_many :escolas, :through => :cursos

  validates :nome, presence: true, length: { minimum: 2, maximum: 45}
  validates :matricula, presence: true, length: {minimum: 1, maximum: 45}
  validates :status, inclusion: { in: [0,1],
                                  message: "%{value} inválido."},
            allow_nil: false
end
