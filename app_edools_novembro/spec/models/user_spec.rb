require 'rails_helper'

RSpec.describe User, type: :model do
  context "valid Factory" do
    it "has a valid factory" do
      expect(FactoryGirl.build(:user)).to be_valid
    end
  end

  context "validations" do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:encrypted_password) }
  end

  context "relationship" do
    it { is_expected.to have_many(:courses) }
    it { is_expected.to have_many(:students) }
    it { is_expected.to have_many(:schools) }
  end
end
