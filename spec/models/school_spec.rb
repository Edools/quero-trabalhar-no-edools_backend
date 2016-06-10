require 'rails_helper'

describe School do
  it { is_expected.to have_many :courses }
end
