class School < ActiveRecord::Base
  has_many :courses
  has_many :students

  validates_presence_of :name, message: "Campo não pode ficar em branco"
  validates_presence_of :email_responsible, message: "Campo não pode ficar em branco"
  validates_presence_of :pitch, message: "Campo não pode ficar em branco"
  validates_uniqueness_of :name, message: "Este nome já existe, escolha um novo nome"
  validates_uniqueness_of :email_responsible, message: "Email já cadastrado"
  validates_uniqueness_of :subdomain, message: "Subdominio já escolhido, escolha outro"
  validates_format_of :subdomain, with: /[A-z\d]*.[A-z\d]*\.edools.com/, message: "Formato inválido, o subdominio deve terminar com .edools.com"
  validates_format_of :email_responsible, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create, message: "Formato de email invalido"
end
