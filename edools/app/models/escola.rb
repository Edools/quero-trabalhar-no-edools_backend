class Escola < ActiveRecord::Base

  has_many :cursos, :dependent => :destroy
  has_many :alunos

  validates_presence_of :nome, :subdominio, :email
  validates_format_of :subdominio, with: SUBDOMAIN_FORMAT
  validates_format_of :email, with: EMAIL_FORMAT


  def self.search(search)
    where("nome LIKE ?", "%#{search}%")
  end

end
