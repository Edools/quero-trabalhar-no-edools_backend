require 'rails_helper'

RSpec.describe StudentCourse, type: :model do
  subject { FactoryGirl::build(:student_course) }

  context 'attributes' do
    it { is_expected.to respond_to(:course_id) }
    it { is_expected.to respond_to(:student_id) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:course_id) }
    it { is_expected.to validate_presence_of(:student_id) }
  end

  context 'associations' do
    it { is_expected.to belong_to(:course) }
    it { is_expected.to belong_to(:student) }
  end
end
