require 'rails_helper'
require 'money-rails/test_helpers'

RSpec.describe Course, type: :model do
  subject { FactoryBot.build(:course) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:school) }
    it { is_expected.to have_many(:students) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:school) }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to monetize(:price) }
  end
end
