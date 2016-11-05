class School < ApplicationRecord
  validates_length_of :nome, minimum: 1, maximum: 50, allow_blank: false
end
