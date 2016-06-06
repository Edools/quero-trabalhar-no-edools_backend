require 'rails_helper'

RSpec.describe SchoolsController, type: :controller do
  describe 'GET index' do
    it 'matches schools array' do
      schools = create_list(:school, 2)

      get :index

      expect(assigns(:schools)).to match_array(schools)
    end

    context 'when params name is present' do
      it 'does return the searched school' do
        schools = create_list(:school, 2)
        school  = create(:school, name: 'Simple name')

        get :index, name: 'Simple name'

        expect(assigns(:schools).count).to eq(1)
        expect(assigns(:schools)).to match_array([school])
      end

      it 'does return nothing when has no school matched' do
        schools = create_list(:school, 2)
        school  = create(:school, name: 'Simple name')

        get :index, name: 'wrong name'

        expect(assigns(:schools).count).to eq(0)
        expect(assigns(:schools)).not_to match_array([school])
      end
    end
  end

  describe 'GET new' do
    it 'creates a new instance of School' do
      get :new

      expect(assigns(:school)).to be_instance_of(School)
    end
  end

  describe 'POST create' do
    context 'when valid' do
      it 'create a new School' do
        valid_params = attributes_for(:school)

        expect do
          post :create, school: valid_params
        end.to change { School.count }.by(1)
      end
    end

    context 'when invalid' do
      it 'dont create a new School' do
        invalid_params = attributes_for(:school, name: '')

        expect do
          post :create, school: invalid_params
        end.to change { School.count }.by(0)
      end
    end
  end

  describe 'GET edit' do
    it 'creates a new instance of School' do
      school = create(:school)

      get :edit, id: school.id

      expect(assigns(:school)).to be_instance_of(School)
    end
  end

  describe 'PUT update' do
    context 'when valid' do
      it 'updates the desired School' do
        school = create(:school)
        valid_params = attributes_for(:school, name: 'New name')

        put :update, id: school.id, school: valid_params

        expect(school.reload.name).to eq('New name')
      end
    end

    context 'when invalid' do
      it 'dont update the desired School' do
        school = create(:school)
        invalid_params = attributes_for(:school, name: '')

        put :update, id: school.id, school: invalid_params

        expect(school.reload.name).not_to eq('')
      end
    end
  end

  describe 'GET show' do
    it 'assign @school as a specific School' do
      school = create(:school)

      get :show, id: school.id

      expect(assigns(:school)).to eq(school)
    end
  end

  describe 'DELETE destroy' do
    it 'destroys a specific School on db' do
      school = create(:school)

      expect do
        delete :destroy, id: school.id
      end.to change { School.count }.by(-1)
    end
  end
end
