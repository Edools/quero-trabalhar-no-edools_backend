class Escola < ActiveRecord::Base
  has_many :curso

  validates :email, presence: true
  validates :nome, length:{minimum: 5}
end
