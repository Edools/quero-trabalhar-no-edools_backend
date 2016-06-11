require 'rails_helper'

RSpec.describe Student, type: :model do
  it { is_expected.to belong_to :user }
  it { is_expected.to have_and_belong_to_many :courses }
end
