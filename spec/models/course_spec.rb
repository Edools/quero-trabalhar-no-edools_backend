require "rails_helper"

RSpec.describe Course, :type => :model do
  subject(:course) { create(:course) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:content) }
  it { is_expected.to validate_presence_of(:price) }
  it { is_expected.to validate_presence_of(:start_date) }
  it { is_expected.to validate_presence_of(:end_date) }
  it { should belong_to(:school) }

  it 'is valid with valid attributes' do
    expect(course).to be_valid
  end

  context 'duration' do
    it 'is invalid with an start date bigger than end date' do
      expect(build(:course, start_date: '2018-07-25', end_date: '2018-07-24')).not_to be_valid
    end
  end

end