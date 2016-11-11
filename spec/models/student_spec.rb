require 'rails_helper'

RSpec.describe Student, type: :model do
  subject { FactoryGirl::build(:student) }

  context 'attributes' do
    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:status) }
    it { is_expected.to respond_to(:school_id) }
  end

  context 'associations' do
    it { is_expected.to belong_to(:school) }
    it { is_expected.to have_many(:student_courses) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_presence_of(:school_id) }

    it { is_expected.to validate_numericality_of(:status) }
    it { is_expected.to validate_inclusion_of(:status).in_array(Student::STATUSES_IDS) }
  end
end
