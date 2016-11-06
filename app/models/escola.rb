class Escola < ApplicationRecord
    has_many :cursos
    has_many :alunos, :through => :cursos

    validates :nome, presence: true, length: { minimum: 2, maximum: 45 }
    VALID_SUBDOMAIN_REGEX = /\A[\w+\-.]+edools.com/i
    validates :subdominio, presence: true, format: { with: VALID_SUBDOMAIN_REGEX }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

    def self.search(search)
      where("nome LIKE ?", "%#{search}%")
    end
end
