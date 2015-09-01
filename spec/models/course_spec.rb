require 'rails_helper'

RSpec.describe Course, :type => :model do
  context "Validations" do
    describe "title" do
      it "should be valid unless it's nil" do
        course = build :course
        expect(course).to be_valid
        course.title = nil
        expect(course).not_to be_valid
      end
    end
    describe "duration" do
      it "should be valid unless it's nil" do
        course = build :course
        expect(course).to be_valid
        course.duration = nil
        expect(course).not_to be_valid
      end
    end
    describe "active_students" do
      it "should be valid unless it's nil" do
        course = build :course
        expect(course).to be_valid
        course.active_students = nil
        expect(course).not_to be_valid
      end
    end
    describe "price" do
      it "should be valid unless it's nil" do
        course = build :course
        expect(course).to be_valid
        course.price = nil
        expect(course).not_to be_valid
      end
    end
    describe "creation_date" do
      it "should be valid unless it's nil" do
        course = build :course
        expect(course).to be_valid
        course.creation_date = nil
        expect(course).not_to be_valid
      end
    end
  end
  context "Scopes" do
    describe "by_school" do
      it "returns courses of given school" do
        course1 = create :course
        school = course1.school
        course2 = create :course, school: school
        course3 = create :course
        expect(Course.by_school(school.id)).to include(course1)
        expect(Course.by_school(school.id)).to include(course2)
        expect(Course.by_school(school.id)).not_to include(course3)
      end
    end
  end
end