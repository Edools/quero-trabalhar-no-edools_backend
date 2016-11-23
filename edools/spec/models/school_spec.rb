require 'rails_helper'

RSpec.describe School, type: :model do
  it{ is_expected.to validate_presence_of(:name) }
  it{ is_expected.to validate_presence_of(:email) }
  it{ is_expected.to validate_presence_of(:pitch) }
  it{ is_expected.to validate_presence_of(:subdomain) }
  it{ is_expected.to have_many(:courses) }

end
