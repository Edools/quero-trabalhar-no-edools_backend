require 'rails_helper'

RSpec.describe Enrollment, type: :model do
  subject { FactoryGirl.create(:enrollment) }
  context 'validations' do
    it { is_expected.to validate_presence_of(:course) }
    it { is_expected.to validate_presence_of(:student) }
  end

  context 'relations' do
    it {is_expected.to belong_to(:course)}
    it {is_expected.to belong_to(:student)}
  end
end
