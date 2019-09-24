require 'rails_helper'

RSpec.describe School sController, type: :controller do
  let!(:school) { create(:school) }

  describe 'GET #show' do
    before(:each) do
      get :show, params: { id: school.id }, xhr: true, format: 'js'
    end

    context 'Success' do
      it 'returns school' do
        expect(assigns[:school].id).to eq(@school.id)
      end

      it 'returns 200 status code' do
        expect(response.status).to eq(200)
      end
    end
  end

  describe 'GET new' do
    context 'Success' do
      before :each do
        get :new, xhr: true, format: 'js'
      end

      it 'returns status 204' do
        expect(response.status).to eq(204)
      end
    end
  end

  describe 'POST create' do
    context 'Success' do
      before :each do
        post :create,
             params: {
              school: attributes_for(:school)
             },
             xhr: true, format: 'js'
      end

      it 'returns 200 status code' do
        expect(response.status).to eq(200)
      end

      it 'returns created object' do
        expect(assigns[:school].id).not_to be_nil
      end
    end

    context 'Failure' do
      before :each do
        post :create,
             params: { school: { name: '' } },
             xhr: true, format: 'js'
      end

      it 'returns created object' do
        expect(assigns[:school].id).to be_nil
      end
    end
  end

  describe 'GET edit' do
    before(:each) do
      get :edit, params: { id: school.id }, xhr: true
    end

    context 'Success' do
      it 'returns the selected school' do
        expect(assigns[:school].id).to eq(school.id)
      end

      it 'returns js' do
        expect(response.content_type).to eq('text/javascript')
      end

      it 'returns status 200' do
        expect(response.status).to eq(200)
      end
    end
  end

  describe 'PUT update' do
    context 'Success' do
      before(:each) do
        put :update,
            params: {
              id: school.id, school: { name: 'Test' }
            }, xhr: true, format: 'js'
        @school.reload
      end

      it 'returns js' do
        expect(response.content_type).to eq('text/javascript')
      end

      it 'returns status 200' do
        expect(response.status).to eq(200)
      end

      it 'returns updated school' do
        expect(assigns[:school].name).to eq('Test')
      end
    end

    context 'Failure' do
      before(:each) do
        put params: {
          id: school.id, school: { name: nil }
        }, xhr: true, format: 'js'
      end

      it 'returns updated school' do
        expect(assigns[:school].errors).not_to be_empty
      end
    end
  end
end
