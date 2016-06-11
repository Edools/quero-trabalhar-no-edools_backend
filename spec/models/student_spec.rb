require 'rails_helper'

RSpec.describe Student, type: :model do
  subject { FactoryGirl.create(:student) }
  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:birthday) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to allow_value('test@test.com').for(:email) }
    it { is_expected.to allow_value('test@test.com.br').for(:email) }
    it { is_expected.to_not allow_value('invalid_email.com').for(:email) }
    it { is_expected.to_not allow_value('invalid_email').for(:email) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  end

  context 'relations' do
    # it {is_expected.to have_and_belongs_to_many(:courses)}
    it {is_expected.to have_many(:enrollments)}
    it {is_expected.to have_many(:courses).through(:enrollments)}
  end
end
