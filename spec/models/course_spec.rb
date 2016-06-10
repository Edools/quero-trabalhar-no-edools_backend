require 'rails_helper'

RSpec.describe Course, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_length_of(:title).is_at_least(3).is_at_most(65) }
    it { is_expected.to validate_presence_of(:school) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_numericality_of(:price) }
  end

  context 'relations' do
    it {is_expected.to belong_to(:school)}
  end
end
