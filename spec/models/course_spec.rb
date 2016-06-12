require 'rails_helper'

RSpec.describe Course, type: :model do
    context 'associations' do
      it { is_expected.to belong_to(:school) }
    end

    context 'model validations' do
    	it { is_expected.to validate_presence_of(:title) }
    	it { is_expected.to validate_presence_of(:school) }
    	it { is_expected.to validate_presence_of(:content) }
    	it { is_expected.to validate_presence_of(:duration) }
    	it { is_expected.to validate_presence_of(:price) }
    end

  context 'table fields' do
    it { is_expected.to have_db_column(:title	).of_type(:string) }
    it { is_expected.to have_db_column(:content).of_type(:string) }
    it { is_expected.to have_db_column(:duration).of_type(:string) }
    it { is_expected.to have_db_column(:description).of_type(:text) }

    it { is_expected.to have_db_column(:school_id).of_type(:integer) }
  end

  context 'factories' do
    it { expect(build(:valid_course)).to be_valid }
    it { expect(build(:invalid_course)).to be_invalid }
  end
end
