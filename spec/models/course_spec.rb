require 'rails_helper'

RSpec.describe Course, type: :model do
  it 'has a valid factory' do
    expect(build(:course)).to be_valid
  end

  subject { build(:course) }
  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:duration) }
    it { is_expected.to validate_numericality_of(:duration).is_greater_than(0).only_integer }
    it { is_expected.to validate_presence_of(:active_students) }
    it { is_expected.to validate_numericality_of(:active_students).is_greater_than(0).only_integer }    
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to allow_value('100,00').for(:price) }
    it { is_expected.to_not allow_value('').for(:price) }
    it { is_expected.to_not allow_value('abc').for(:price) }
    it { is_expected.to validate_presence_of(:school) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:school) }
  end
end
