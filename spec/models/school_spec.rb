require 'rails_helper'

RSpec.describe School, type: :model do
  describe 'associations' do
    it { should have_many(:courses) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:owner_email) }
    it { is_expected.to validate_presence_of(:creation_date) }
    it { is_expected.to validate_presence_of(:subdomain) }
    it { is_expected.to validate_uniqueness_of(:subdomain) }
    it { is_expected.to allow_value('sub_domain').for(:subdomain) }
    it { is_expected.to_not allow_value('sub domain').for(:subdomain) }
    it { is_expected.to allow_value('teste@email.com').for(:owner_email) }
    it { is_expected.to_not allow_value('teste @email.com').for(:owner_email) }
  end
end
