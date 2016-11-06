class Curso < ApplicationRecord
  belongs_to :escola
  has_and_belongs_to_many :alunos

  def self.search(search)
    where("titulo LIKE ?", "%#{search}%")
  end
end
