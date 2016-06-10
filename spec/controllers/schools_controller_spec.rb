require 'rails_helper'

RSpec.describe SchoolsController, type: :controller do

  describe 'GET #index' do
    let(:schools) { FactoryGirl.create_list(:school, 3) }

    it 'assign schools to @schools' do
      get :index
      expect(assigns[:schools]).to match_array(schools)
    end

    it 'render index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'return http status ok' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #new' do
    it 'assigns a new School to @school' do
      get :new
      expect(assigns[:school]).to be_a_new(School)
    end

    it 'render template new' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'return http status ok' do
      get :new
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let(:school) { FactoryGirl.attributes_for(:school) }

      it 'create school' do
        expect {
          post :create, school: school
        }.to change(School, :count).by(1)
      end

      it 'redirect to school details (show)' do
        post :create, school: school
        expect(response).to redirect_to(school_path(School.last))
      end

      it 'returns a http status redirect' do
        post :create, school: school
        expect(response).to have_http_status(:redirect)
      end
    end

    context 'with invalid params' do
      let(:invalid_school) { FactoryGirl.attributes_for(:school, name: nil) }

      it 'dont create school' do
        expect {
          post :create, school: invalid_school
        }.to_not change(School, :count)
      end

      it 'render new template' do
        post :create, school: invalid_school
        expect(response).to render_template(:new)
      end

      it 'returns a http status ok' do
        post :create, school: invalid_school
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET #show' do
    context 'when school exist' do
      let(:school) {FactoryGirl.create(:school)}
      it 'assigns loaded school to @school' do
        get :show, id: school.id
        expect(assigns[:school]).to eq(school)
      end

      it 'render template show' do
        get :show, id: school.id
        expect(response).to render_template(:show)
      end

      it 'return http status ok' do
        get :show, id: school.id
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when school do not exist' do
      it 'Raise a ActiveRecord::RecordNotFound error' do
        expect {
          get :show, id: -9999
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe 'GET #edit' do
    context 'when school exist' do
      let(:school) {FactoryGirl.create(:school)}
      it 'assigns loaded school to @school' do
        get :edit, id: school.id
        expect(assigns[:school]).to eq(school)
      end

      it 'render template edit' do
        get :edit, id: school.id
        expect(response).to render_template(:edit)
      end

      it 'return http status ok' do
        get :edit, id: school.id
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when school do not exist' do
      it 'Raise a ActiveRecord::RecordNotFound error' do
        expect {
          get :edit, id: -9999
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe 'PUT #update' do
    context 'when school exist' do
      context 'with valid params' do
        let(:school) {FactoryGirl.create(:school)}
        let(:attributes) { FactoryGirl.attributes_for(:school) }
        it 'update school attributes' do
          put :update, id: school.id, school: attributes
          school.reload
          expect(school.name).to eq(attributes[:name])
        end

        it 'redirect to school details (show)' do
          put :update, id: school.id, school: attributes
          expect(response).to redirect_to(school_path(school))
        end

        it 'have http status redirect' do
          put :update, id: school.id, school: attributes
          expect(response).to have_http_status(:redirect)
        end
      end

      context 'with invalid params' do
        let(:school) {FactoryGirl.create(:school)}
        let(:invalid_attributes) { FactoryGirl.attributes_for(:school, name: nil) }
        it 'not update school attributes' do
          expect {
            put :update, id: school.id, school: invalid_attributes
          }.to_not change(school, :name)
        end

        it 'render edit view' do
          put :update, id: school.id, school: invalid_attributes
          expect(response).to render_template(:edit)
        end

        it 'have http status ok' do
          put :update, id: school.id, school: invalid_attributes
          expect(response).to have_http_status(:ok)
        end
      end
    end

    context 'when school not exist' do
      it 'Raise a ActiveRecord::RecordNotFound error' do
        expect {
          get :edit, id: -9999
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when school exist' do
      let(:school) { FactoryGirl.create(:school) }
      it 'remove school from database' do
        school
        expect {
          delete :destroy, id: school.id
        }.to change(School, :count).by(-1)
      end

      it 'redirect to schools listing' do
        delete :destroy, id: school.id
        expect(response).to redirect_to(schools_path)
      end
    end
    context 'when school not exist' do
      it 'Raise a ActiveRecord::RecordNotFound error' do
        expect {
          delete :destroy, id: -9999
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
