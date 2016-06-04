require 'rails_helper'

RSpec.describe School, type: :model do

  let(:school) { build(:school) }

  it "has a valid factory" do
    expect(school).to be_valid
  end

  it "has ActiveModel Validations" do    
    expect(school).to validate_presence_of(:name)
    expect(school).to validate_presence_of(:owner_email)
    expect(school).to validate_presence_of(:pitch)
    expect(school).to validate_presence_of(:subdomain)
    expect(school).to validate_presence_of(:date_of_creation)
  end

end
