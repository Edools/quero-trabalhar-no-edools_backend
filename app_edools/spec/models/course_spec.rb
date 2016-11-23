require 'rails_helper'

RSpec.describe Course, type: :model do
  context "valid Factory" do
    it "has a valid factory" do
      expect(FactoryGirl.build(:course)).to be_valid
    end
  end

  context "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_presence_of(:duration) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:school_id) }
  end

  context "relations" do
    it { is_expected.to belong_to(:school) }
  end
end
