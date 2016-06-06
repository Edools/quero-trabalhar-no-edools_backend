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
    describe "price" do
      it "should be valid unless it's nil" do
        course = build :course
        expect(course).to be_valid
        course.price = nil
        expect(course).not_to be_valid
      end
    end
  end
  context "Scopes" do
    describe "search_by_title" do
      it "returns courses with given title" do
        course_a = create :course, title: "course A"
        course_b = create :course, title: "course B"
        course_ab = create :course, title: "course AB"
        expect(Course.search_by_title("A")).to include(course_a)
        expect(Course.search_by_title("A")).to include(course_ab)
        expect(Course.search_by_title("A")).not_to include(course_b)
      end
    end
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