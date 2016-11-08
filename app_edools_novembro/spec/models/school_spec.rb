require 'rails_helper'

RSpec.describe School, type: :model do
  let(:user){ FactoryGirl.build(:user) }

  context "valid Factory" do
    it "has a valid factory" do
      expect(FactoryGirl.build(:school)).to be_valid
    end
  end

  context "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:pitch) }
    it { is_expected.to validate_presence_of(:subdomain) }

    context "uniqueness" do
      it { is_expected.to validate_uniqueness_of :name }
      it { is_expected.to validate_uniqueness_of :email }
      it { is_expected.to validate_uniqueness_of :subdomain }
    end

    context "format" do
      xit { is_expected.to validate_format_of :subdomain }
    end
  end

  context "relationship" do
    it { is_expected.to have_many(:courses) }
    it { is_expected.to have_many(:students) }
  end
end
