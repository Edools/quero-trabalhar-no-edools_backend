require 'rails_helper'

RSpec.describe School, type: :model do
  subject { FactoryBot.build(:school) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:courses) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:pitch) }
    it { is_expected.to validate_presence_of(:subdomain) }
  end
end
