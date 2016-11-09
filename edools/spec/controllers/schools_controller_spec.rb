require 'rails_helper'

RSpec.describe SchoolsController, type: :controller do
  describe 'Create Schools' do
    it '# Successful creates' do
      school = FactoryGirl.attributes_for(:school)
      post :create, params: { school: school }
      new_student = School.last
      expect(response).to redirect_to(school_path(new_student.id))
    end
  end

  describe 'Edit Schools' do
    it '# Successful edits' do
      school = FactoryGirl.create(:school)
      new_name = "New School Name"
      post :update, params: { id: school.id, school: { name: new_name } }
      upd_school = School.find(school.id)

      expect(response).to redirect_to(school_path(school.id))
      expect(upd_school.name).to eq(new_name)
    end
  end

  describe 'Destroy Schools' do
    it '# Successful Destroys' do
      school = FactoryGirl.create(:school)
      delete :destroy, params: { id: school.id }
      expect(response).to redirect_to(schools_path)
      expect(School.count).to eq(0)
    end
  end
end
