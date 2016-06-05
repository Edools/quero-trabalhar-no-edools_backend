class Escola < ActiveRecord::Base
  validates :nome, presence: { message: "obrigatório" }
  validates_format_of :sub_dominio, with: /(?:[A-Za-z0-9][A-Za-z0-9\-]{0,61}[A-Za-z0-9]|[A-Za-z0-9])/, message: "inválido"
end
