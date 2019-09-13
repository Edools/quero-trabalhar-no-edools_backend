# frozen_string_literal: true

class Matriculation < ApplicationRecord
  belongs_to :course
  belongs_to :user
end
