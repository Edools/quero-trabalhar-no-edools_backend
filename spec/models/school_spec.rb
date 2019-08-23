require 'rails_helper'

RSpec.describe School, type: :model do
  subject {
    described_class.new(attributes_for(:school))
  }
  it "is valid with valid attributes" do
    expect(School.new(attributes_for(:school))).to be_valid
  end

  context "with 2 or more schools" do
    it "orders them in reverse chronologically" do
      school1 = School.create!(:email => "first@mail.com", :name => "first name", :pitch => "first pitch", :subdomain => "test_#{Faker::Internet.slug}")
      school2 = School.create!(:email => "second@mail.com", :name => "second name", :pitch => "second pitch", :subdomain => "test_#{Faker::Internet.slug}")
      expect(School.all).to eq([school1, school2])
    end
  end

  describe "Validations" do
    it "is not valid without..." do
      subject.name = nil
      expect(subject).to_not be_valid
      subject.email = nil
      expect(subject).to_not be_valid
      subject.pitch = nil
      expect(subject).to_not be_valid
      subject.subdomain = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an email" do
      subject.email = "email"
      expect(subject).to_not be_valid
    end
  end
end
