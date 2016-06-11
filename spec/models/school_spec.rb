require 'rails_helper'

RSpec.describe School, type: :model do
  it 'has a valid factory' do
    expect(build(:school)).to be_valid
  end

  subject { build(:school) }
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:owner_email) }
    it { is_expected.to validate_uniqueness_of(:owner_email) }
    it { is_expected.to allow_value('teste@gmail.com').for(:owner_email) }
    it { is_expected.not_to allow_value('teste.com.br').for(:owner_email) }
    it { is_expected.not_to allow_value('@').for(:owner_email) }
    it { is_expected.to validate_presence_of(:subdomain) }
    it { is_expected.to allow_value('minha-escola.edools.com').for(:subdomain) }
    it { is_expected.not_to allow_value('escola.com.br').for(:subdomain) }
    it { is_expected.not_to allow_value('edools.com').for(:subdomain) }

  end

  describe 'associations' do
    it { is_expected.to have_many(:courses) }
  end
end
