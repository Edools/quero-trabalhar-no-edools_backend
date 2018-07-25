# frozen_string_literal: true

require 'rails_helper'

RSpec.describe School, type: :model do
  subject { FactoryBot.build(:school) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:courses) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:pitch) }
    it { is_expected.to validate_presence_of(:subdomain) }
    it { should validate_uniqueness_of(:subdomain) }

    context 'with invalid subdomain format' do
      it 'should not be valid' do
        subject.subdomain = '123.com'
        expect(subject.valid?).to be_falsey
      end
      it 'should not be valid' do
        subject.subdomain = 'abc%'
        expect(subject.valid?).to be_falsey
      end
    end

    context 'with valid subdomain format' do
      it 'should be valid' do
        subject.subdomain = 'valid-subdomain'
        expect(subject.valid?).to be_truthy
      end
    end
  end
end
