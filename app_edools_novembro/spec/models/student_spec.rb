require 'rails_helper'

RSpec.describe Student, type: :model do
  context "valid Factory" do
    it "has a valid factory" do
      expect(FactoryGirl.build(:student)).to be_valid
    end
  end

  context "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_presence_of(:phone) }
    it { is_expected.to validate_presence_of(:document) }
    it { is_expected.to validate_presence_of(:responsible) }
    it { is_expected.to validate_presence_of(:registration) }
    it { is_expected.to validate_presence_of(:status_student) }
    it { is_expected.to validate_presence_of(:course_id) }
    it { is_expected.to validate_presence_of(:school_id) }
  end

  context "relationship" do
    it { is_expected.to belong_to(:school) }
  end
end
