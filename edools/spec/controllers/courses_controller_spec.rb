require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  describe '# Create new course' do
    it '# Successful create' do
      school = FactoryGirl.create(:school)
      course = FactoryGirl.attributes_for(:course, school_id: school.id)
      post :create, params: { school_id: school.id, course: course }
      last_course = Course.last

      expect(response).to redirect_to(school_path(school.id))
      expect(last_course.title).to eq(course[:title])
    end
  end

  describe '# Edit Course' do
    it '# Successful Edit' do
      school = FactoryGirl.create(:school)
      course = FactoryGirl.create(:course, school: school)
      course_title = "New Title"

      post :update, params: { school_id: school.id, id: course.id, course: { title: course_title } }
      upd_course = Course.find(course.id)
      puts upd_course.title
      expect(upd_course.title).to eq(course_title)
    end
  end

  describe '# Destroy Course' do
    it '# Successful Destroy' do
      school = FactoryGirl.create(:school)
      course = FactoryGirl.create(:course, school: school)

      delete :destroy, params: { id: course.id, school_id: school.id }
      expect(response).to redirect_to(school_path(school.id))
      expect(Course.count).to eq(0)
    end
  end
end
