class Curso < ActiveRecord::Base

  belongs_to :escola
  has_many :alunos, :dependent => :destroy

  validates_presence_of :titulo, :preco, :duracao
  validates_associated :escola
  validates :preco, numericality: { greater_than_or_equal_to: 0.1 }

  def self.search(search)
    where("titulo LIKE ?", "%#{search}%")
  end

end
