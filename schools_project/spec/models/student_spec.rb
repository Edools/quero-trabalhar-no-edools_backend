require 'rails_helper'

RSpec.describe Student, type: :model do
  subject { FactoryBot.build(:student) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:course) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:course) }
    it { is_expected.to validate_presence_of(:name) }
  end
end
