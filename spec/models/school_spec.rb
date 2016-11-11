require 'rails_helper'

RSpec.describe School, type: :model do
  subject { FactoryGirl::build(:school) }

  context 'attributes' do
    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:owner_email) }
    it { is_expected.to respond_to(:pitch) }
    it { is_expected.to respond_to(:subdomain) }
  end

  context 'associations' do
    it { is_expected.to have_many(:courses) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:owner_email) }
    it { is_expected.to validate_presence_of(:pitch) }
    it { is_expected.to validate_presence_of(:subdomain) }

    it { is_expected.to validate_uniqueness_of(:subdomain) }

    context 'format' do
      context 'subdomain' do
        it 'is valid with a proper subdomain string' do
          subject.subdomain = 'subdomain.edools.com'

          expect(subject).to be_valid
        end

        it 'is invalid without proper subdomain string' do
          subject.subdomain = 'not.a.valid.edools.subdomain.com'

          expect(subject).to be_invalid
        end
      end
    end
  end
end
