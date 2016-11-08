require 'rails_helper'

RSpec.describe Course, type: :model do
  it "creates a course" do
    course = build(:course)
    expect(course).to be_valid
    expect(course.errors.size).to eq(0)
  end

  it "fails validation with invalid values" do
    invalid_course = build(:invalid_course)
    expect(invalid_course).to be_invalid
    expect(invalid_course.errors.size).to eq(5)
  end
end
