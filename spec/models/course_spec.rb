require 'rails_helper'

RSpec.describe Course, type: :model do
  subject { FactoryGirl::build(:course) }

  context 'attributes' do
    it { is_expected.to respond_to(:title) }
    it { is_expected.to respond_to(:school_id) }
    it { is_expected.to respond_to(:description) }
    it { is_expected.to respond_to(:content) }
    it { is_expected.to respond_to(:length) }
    it { is_expected.to respond_to(:price) }
  end

  context 'associations' do
    it { is_expected.to belong_to(:school) }
    it { is_expected.to have_many(:student_courses) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:school_id) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_presence_of(:length) }
    it { is_expected.to validate_presence_of(:price) }

    it { is_expected.to validate_numericality_of(:price) }
  end
end
