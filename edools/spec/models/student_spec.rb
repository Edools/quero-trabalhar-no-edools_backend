require 'rails_helper'

RSpec.describe Student, type: :model do
  it "creates a student" do
    student = build(:student)
    expect(student).to be_valid
    expect(student.errors.size).to eq(0)
  end

  it "fails validation with invalid values" do
    invalid_student = build(:invalid_student)
    expect(invalid_student).to be_invalid
    expect(invalid_student.errors.size).to eq(1)
  end
end
