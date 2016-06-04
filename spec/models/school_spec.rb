require 'rails_helper'

RSpec.describe School, type: :model do

  let(:school) { build(:school) }

  it "has a valid factory" do
    expect(school).to be_valid
  end

  describe "has ActiveModel Validations" do
    it { expect(school).to validate_presence_of(:name) }
    it { expect(school).to validate_presence_of(:owner_email) }
    it { expect(school).to validate_presence_of(:pitch) }
    it { expect(school).to validate_presence_of(:subdomain) }
    it { expect(school).to validate_presence_of(:date_of_creation) }
  end

end
