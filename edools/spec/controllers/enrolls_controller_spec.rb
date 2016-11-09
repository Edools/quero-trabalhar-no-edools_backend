require 'rails_helper'

RSpec.describe EnrollsController, type: :controller do
  describe '# Create new enroll' do
    it '# Successful create' do
      school = FactoryGirl.create(:school)
      course = FactoryGirl.create(:course, school_id: school.id)
      student = FactoryGirl.create(:student)
      enroll = { student_id: student.id, course_id: course.id }
      post :create, params: { student_id: student.id, enroll: enroll }

      expect(response).to redirect_to(student_path(student.id))
      expect(student.enrolls.count).to eq(1)
    end
  end

  describe '# Destroy Enroll' do
    it '# Successful Destroy' do
      school = FactoryGirl.create(:school)
      course = FactoryGirl.create(:course, school_id: school.id)
      student = FactoryGirl.create(:student)
      enroll = Enroll.create(:student_id => student.id, :course_id => course.id)


      delete :destroy, params: { student_id: student.id, id: enroll.id }
      expect(response).to redirect_to(student_path(student.id))
      expect(student.enrolls.count).to eq(0)
    end
  end
end
