require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'associations' do
    it { should belong_to(:school) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:duration) }
    it { is_expected.to validate_presence_of(:duration_unit) }
    it { is_expected.to validate_presence_of(:creation_date) }
    it { is_expected.to validate_presence_of(:price) }
  end
end
