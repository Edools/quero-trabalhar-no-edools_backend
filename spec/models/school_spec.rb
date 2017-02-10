require 'rails_helper'

RSpec.describe School, :type => :model do
  context "Validations" do
    describe "name" do
      it "should be valid unless it's nil" do
        school = build :school
        expect(school).to be_valid
        school.name = nil
        expect(school).not_to be_valid
      end
    end
    describe "email" do
      it "should be valid unless it's nil" do
        school = build :school
        expect(school).to be_valid
        school.email = nil
        expect(school).not_to be_valid
      end
      it "should be valid unless it doesn`t contain @" do
        school = build :school
        school.email = "email"
        expect(school).not_to be_valid
      end
    end
    describe "subdomain" do
      context "should be valid if" do
        it "isn't nil, or is valid, or is unique" do
          school = build :school
          expect(school).to be_valid
        end
      end
      context "should be invalid if" do
        it "is nil" do
          school = build :school ,subdomain: nil
          expect(school).not_to be_valid
        end
        it "has a space" do
          school = build :school ,subdomain: "test "
          expect(school).not_to be_valid
        end
        it "has a special character" do
          school = build :school ,subdomain: "test!"
          expect(school).not_to be_valid
        end
        it "isn't unique" do
          create :school, subdomain: "test"
          school = build :school, subdomain: "test"
          expect(school).not_to be_valid
        end
      end
    end
    describe "creation_date" do
      it "should be valid unless it's nil" do
        school = build :school
        expect(school).to be_valid
        school.creation_date = nil
        expect(school).not_to be_valid
      end
    end
  end
  context "Scopes" do
    describe "search_by_name" do
      it "returns schools with given name" do
        school_a = create :school, name: "School A"
        school_b = create :school, name: "School B"
        school_ab = create :school, name: "School AB"
        expect(School.search_by_name("A")).to include(school_a)
        expect(School.search_by_name("A")).to include(school_ab)
        expect(School.search_by_name("A")).not_to include(school_b)
      end
    end
  end
  context "Methods" do
    describe "#active_students" do
      it "returns school's courses' active_students sum" do
        school = create :school
        create :course, school: school, active_students: 5
        create :course, school: school, active_students: 7
        school.reload
        expect(school.active_students).to eq(12)
      end
    end
  end
end
