class School < ApplicationRecord
  has_many :courses, inverse_of: :school, dependent: :destroy
  validates_associated :courses
  accepts_nested_attributes_for :courses, reject_if: :all_blank, allow_destroy: true

  validates_length_of :nome, minimum: 5, maximum: 50, allow_blank: false
  validates_uniqueness_of :nome, :email_dono, :sub_dominio
  validates :nome, :email_dono, :pitch, :sub_dominio, :data_criacao, presence: true
  validates_format_of :sub_dominio, :with => /\A[a-zA-Z0-9\-]*?\Z/,:message => 'Aceita apenas letras, número e hífen'
  validates_format_of :email_dono, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
end
