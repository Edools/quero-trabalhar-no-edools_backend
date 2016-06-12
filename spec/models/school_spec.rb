require 'rails_helper'

RSpec.describe School, type: :model do
  context 'associations' do
    it { is_expected.to have_many(:courses).dependent(:restrict_with_error) }
    it { is_expected.to have_many(:students).through(:courses) }
  end

  context 'model validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:owner_email) }
    it { is_expected.to validate_presence_of(:subdomain) }

    describe 'subdomain validations' do
      it { expect(build(:valid_school, subdomain: 'foobar')).to be_valid }
      it { expect(build(:valid_school, subdomain: 'foo-bar')).to be_invalid }
      it { expect(build(:valid_school, subdomain: 'foo--bar')).to be_invalid }
      it { expect(build(:valid_school, subdomain: 'foo.bar')).to be_invalid }
      it { expect(build(:valid_school, subdomain: 'foo bar')).to be_invalid }
    end

    describe 'owner_email validation' do
      it { expect(build(:valid_school, owner_email: 'foo@bar.com')).to be_valid }
      it { expect(build(:valid_school, owner_email: 'foo-bar')).to be_invalid }
      it { expect(build(:valid_school, owner_email: 'foo--bar')).to be_invalid }
      it { expect(build(:valid_school, owner_email: 'foo.bar')).to be_invalid }
      it { expect(build(:valid_school, owner_email: 'foo @bar')).to be_invalid }
    end
  end

  context 'table fields' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:owner_email).of_type(:string) }
    it { is_expected.to have_db_column(:subdomain).of_type(:string) }

    it { is_expected.to have_db_column(:pitch).of_type(:text) }
  end

  context 'factories' do
    it { expect(build(:valid_school)).to be_valid }
    it { expect(build(:invalid_school)).to be_invalid }
  end
end
