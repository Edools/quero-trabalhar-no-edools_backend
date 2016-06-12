require 'rails_helper'

RSpec.describe School, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:owner_email) }
  it { is_expected.to validate_presence_of(:subdomain) }

  context 'subdomain validations' do
	  it { expect(build(:valid_school, subdomain: 'foobar')).to be_valid }
	  it { expect(build(:valid_school, subdomain: 'foo-bar')).not_to be_valid }
	  it { expect(build(:valid_school, subdomain: 'foo--bar')).not_to be_valid }
	  it { expect(build(:valid_school, subdomain: 'foo.bar')).not_to be_valid }
	  it { expect(build(:valid_school, subdomain: 'foo bar')).not_to be_valid }
   end

   context 'owner_email validation' do
	  it { expect(build(:valid_school, owner_email: 'foo@bar.com')).to be_valid }
	  it { expect(build(:valid_school, owner_email: 'foo-bar')).not_to be_valid }
	  it { expect(build(:valid_school, owner_email: 'foo--bar')).not_to be_valid }
	  it { expect(build(:valid_school, owner_email: 'foo.bar')).not_to be_valid }
	  it { expect(build(:valid_school, owner_email: 'foo @bar')).not_to be_valid }
   end
end
