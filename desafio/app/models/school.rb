class School < ApplicationRecord
  validates_length_of :nome, minimum: 5, maximum: 50, allow_blank: false
  validates_uniqueness_of :nome, :email_dono, :sub_dominio
  validates :nome, :email_dono, :pitch, :sub_dominio, :data_criacao, presence: true
  validates_format_of :sub_dominio, :with => /\A[a-zA-Z0-9\-]*?\Z/,:message => 'Aceita apenas letras, número e hífen'
  validates_format_of :email_dono, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
end
