require 'rails_helper'

RSpec.describe School do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:owner_email) }
  it { should validate_presence_of(:subdomain) }

  it { is_expected.to validate_uniqueness_of :name }
  it { is_expected.to validate_uniqueness_of :subdomain }

  it { is_expected.to     allow_value('myscholl.edools.com').for(:subdomain) }
  it { is_expected.to     allow_value('my-scholl.edools.com').for(:subdomain) }
  it { is_expected.not_to allow_value('my#scholl.edools.com').for(:subdomain) }
  it { is_expected.not_to allow_value('edools.com').for(:subdomain) }

  it { is_expected.to have_many(:courses) }
end
