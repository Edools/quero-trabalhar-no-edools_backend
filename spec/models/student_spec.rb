require 'rails_helper'

RSpec.describe Student, type: :model do
  subject {
    described_class.new(attributes_for(:student))
  }
  it "is valid with valid attributes" do
    expect(Student.new(attributes_for(:student))).to be_valid
  end

  context "with 2 or more students" do
    it "orders them in reverse chronologically" do
      student1 = Student.create!(:name => "first name")
      student2 = Student.create!(:name => "second name")
      expect(Student.all).to eq([student1, student2])
    end
  end

  describe "Validations" do
    it "is not valid without..." do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end
end
