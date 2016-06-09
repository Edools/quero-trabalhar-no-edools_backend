require 'rails_helper'

RSpec.describe School, type: :model do
  it "creates a school" do
    school = build(:school)
    expect(school).to be_valid
    expect(school.errors.size).to eq(0)
  end

  it "fails validation with invalid values" do
    invalid_school = build(:invalid_school)
    expect(invalid_school).to be_invalid
    expect(invalid_school.errors.size).to eq(3)
  end
end
