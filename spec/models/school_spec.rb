require 'rails_helper'

RSpec.describe School, type: :model do
  it 'has a valid factory' do
    expect(build(:school)).to be_valid
  end

  subject { build(:school) }
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:owner_email) }
    it { is_expected.to validate_presence_of(:subdomain) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:courses) }
  end
end
