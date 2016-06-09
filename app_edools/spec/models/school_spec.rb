require 'rails_helper'

RSpec.describe School, type: :model do
  context "valid Factory" do
    it "has a valid factory" do
      expect(FactoryGirl.build(:school)).to be_valid
    end
  end

  context "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email_responsible) }
    it { is_expected.to validate_presence_of(:pitch) }

    context "uniqueness" do
      before { create(:school) }
      it { is_expected.to validate_uniqueness_of :name }
      it { is_expected.to validate_uniqueness_of :email_responsible }
      it { is_expected.to validate_uniqueness_of :subdomain }
    end

    context "format" do
      xit { is_expected.to validate_format_of :subdomain }
      xit { is_expected.to validate_format_of :email_responsible }
    end
  end

  context "relations" do
    it { is_expected.to have_many(:courses) }
  end
end
