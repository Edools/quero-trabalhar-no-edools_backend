# frozen_string_literal: true

class User < ApplicationRecord
  has_many :schools
  has_many :matriculations

  validates :name, presence: true
  validates :email, presence: true
  validates :owner, inclusion: [true, false]
end
