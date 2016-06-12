class Aluno < ActiveRecord::Base

  belongs_to :escola
  belongs_to :curso

  validates_presence_of :nome, :email
  validates_associated :curso, :escola
  validates_format_of :email, with: EMAIL_FORMAT

  def self.search(search)
    where("nome LIKE ?", "%#{search}%")
  end
end
