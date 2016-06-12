require 'rails_helper'

RSpec.describe Student, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:course) }
    it { is_expected.to have_one(:school).through(:course) }
  end

  context 'model validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:matricula) }
    it { is_expected.to validate_presence_of(:course) }
  end

  context 'table fields' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:matricula).of_type(:string) }

    it { is_expected.to have_db_column(:course_id).of_type(:integer) }
  end

  context 'factories' do
    it { expect(build(:valid_student)).to be_valid }
    it { expect(build(:invalid_student)).to be_invalid }
  end
end
