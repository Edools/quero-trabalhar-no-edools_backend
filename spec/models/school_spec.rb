require 'rails_helper'

RSpec.describe School, type: :model do
  subject { FactoryGirl.create(:school) }
  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:subdomain) }
    it { is_expected.to allow_value('sub').for(:subdomain) }
    it { is_expected.to allow_value('sub-domain').for(:subdomain) }
    it { is_expected.to_not allow_value('teste.com').for(:subdomain) }
    it { is_expected.to_not allow_value('test@').for(:subdomain) }
    it { is_expected.to validate_uniqueness_of(:subdomain).case_insensitive }
    it { is_expected.to validate_presence_of(:contact_email) }
    it { is_expected.to allow_value('test@test.com').for(:contact_email) }
    it { is_expected.to allow_value('test@test.com.br').for(:contact_email) }
    it { is_expected.to_not allow_value('invalid_email.com').for(:contact_email) }
    it { is_expected.to_not allow_value('invalid_email').for(:contact_email) }
    it { is_expected.to validate_uniqueness_of(:contact_email).case_insensitive }
  end

  context 'relations' do
    it {is_expected.to have_many(:courses)}
    it {is_expected.to have_many(:enrollments).through(:courses)}
    it {is_expected.to have_many(:students).through(:courses)}
  end
end
