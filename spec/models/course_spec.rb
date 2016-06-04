require 'rails_helper'

RSpec.describe Course, type: :model do
  
  let(:course) { build(:course) }

  it "has a valid factory" do
    expect(course).to be_valid
  end

  it "has ActiveModel Validations" do
    expect(course).to validate_presence_of(:title)
    expect(course).to validate_presence_of(:description)
    expect(course).to validate_presence_of(:content)
    expect(course).to validate_presence_of(:duration)
    expect(course).to validate_presence_of(:creation_date)
    expect(course).to validate_presence_of(:active_students)
    expect(course).to validate_presence_of(:price)
  end

  it { should belong_to(:school) }

end
