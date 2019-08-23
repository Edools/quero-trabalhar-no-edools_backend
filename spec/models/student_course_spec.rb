require 'rails_helper'

RSpec.describe StudentCourse, type: :model do
  subject {
    described_class.new(attributes_for(:student_course))
  }
  it "is valid with valid attributes" do
    student = create(:student)
    course = create(:course)
    expect(StudentCourse.new("active" => true, "student" => student, "course" => course)).to be_valid
  end

  context "with 2 or more schools" do
    it "orders them in reverse chronologically" do
      studentcourse1 = StudentCourse.create!("active" => true, "student" => create(:student), "course" => create(:course))
      studentcourse2 = StudentCourse.create!("active" => true, "student" => create(:student), "course" => create(:course))
      expect(StudentCourse.all).to eq([studentcourse1, studentcourse2])
    end
  end

  describe "Validations" do
    it "is not valid without..." do
      subject.active = nil
      expect(subject).to_not be_valid
    end
  end
end
