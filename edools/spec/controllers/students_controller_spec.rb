require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  describe 'Create Students' do
    it '# Successful creates' do
      student = FactoryGirl.attributes_for(:student)
      post :create, params: { student: student }
      new_student = Student.last
      expect(response).to redirect_to(student_path(new_student.id))
    end
  end

  describe 'Edit Students' do
    it '# Successful edits' do
      student = FactoryGirl.create(:student)
      new_name = "New Student Name"
      post :update, params: { id: student.id, student: { name: new_name } }
      upd_student = Student.find(student.id)

      expect(response).to redirect_to(student_path(student.id))
      expect(upd_student.name).to eq(new_name)
    end
  end

  describe 'Destroy Students' do
    it '# Successful Destroys' do
      student = FactoryGirl.create(:student)
      delete :destroy, params: { id: student.id }
      expect(response).to redirect_to(students_path)
      expect(Student.count).to eq(0)
    end
  end

end
