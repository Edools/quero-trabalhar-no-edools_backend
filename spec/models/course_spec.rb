require 'rails_helper'

RSpec.describe Course, type: :model do
  subject {
    described_class.new(attributes_for(:course))
  }
  it "is valid with valid attributes" do
    expect(Course.new(attributes_for(:course))).to be_valid
  end

  context "with 2 or more courses" do
    it "orders them in reverse chronologically" do
      course1 = Course.create!(:tittle => "first tittle", :description => "first description", :content => "first content", :duration => 1, :price => 1)
      course2 = Course.create!(:tittle => "second tittle", :description => "second description", :content => "second content", :duration => 2, :price => 2)
      expect(Course.all).to eq([course1, course2])
    end
  end

  describe "Validations" do
    it "is not valid without..." do
      subject.tittle = nil
      expect(subject).to_not be_valid
      subject.description = nil
      expect(subject).to_not be_valid
      subject.content = nil
      expect(subject).to_not be_valid
      subject.duration = nil
      expect(subject).to_not be_valid
      subject.price = nil
      expect(subject).to_not be_valid
    end
  end
end
