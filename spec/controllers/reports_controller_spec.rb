require 'rails_helper'

RSpec.describe ReportsController, type: :controller do

  describe 'GET #schools_active_students' do
    it 'returns http success' do
      get :schools_active_students
      expect(response).to have_http_status(:success)
    end

    it 'assigns schools as @schools' do
      schools = []
      schools << create(:school)
      schools << create(:school)
      get :schools_active_students
      expect(assigns(:schools)).to match(schools)
    end
  end
end
