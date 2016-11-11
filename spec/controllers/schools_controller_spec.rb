require 'rails_helper'

RSpec.describe SchoolsController, type: :controller do
  let(:school) { FactoryGirl::create(:school) }
  let(:schools) { FactoryGirl::create_list(:school, 4) }
  let(:valid_attributes) { FactoryGirl::attributes_for(:school) }
  let(:invalid_attributes) { FactoryGirl::attributes_for(:school, name: nil) }

  describe '#index' do

    before(:each) { get :index }

    context 'assignments' do
      it 'assigns all schools' do
        expect(assigns(:schools)).to match_array(schools)
      end
    end

    context 'rendering' do
      render_views

      it 'renders correct template' do
        expect(response).to render_template(:index)
      end
    end
  end

  describe '#new' do
    before(:each) { get :new }

    context 'assignments' do
      it 'assigns a new school' do
        expect(assigns(:school)).to be_a_new School
      end
    end

    context 'rendering' do
      render_views

      it 'renders correct template' do
        expect(response).to render_template(:new)
      end
    end
  end

  describe '#create' do
    context 'success' do
      it 'increases schools count' do
        expect do
          post :create, school: valid_attributes
        end.to change(School, :count).by(1)
      end

      it 'redirects to schools#index' do
        post :create, school: valid_attributes

        expect(response).to redirect_to(action: :index)
      end
    end

    context 'failure' do
      it 'does not change schools count' do
        expect do
          post :create, school: invalid_attributes
        end.not_to change(School, :count)
      end

      it 're-enders action new' do
        post :create, school: invalid_attributes

        expect(response).to render_template(:new)
      end
    end
  end

  describe '#show' do
    before(:each) { get :show, id: school.id }

    context 'assignments' do
      it 'assigns school by its id' do
        expect(assigns(:school)).to eq(school)
      end
    end

    context 'rendering' do
      render_views

      it 'renders correct template' do
        expect(response).to render_template(:show)
      end
    end
  end

  describe '#destroy' do
    before(:each) { school.save }

    context 'success' do
      it 'decreases schools count' do
        expect do
          delete :destroy, id: school.id
        end.to change(School, :count).by(-1)
      end

      it 'redirects to index' do
        delete :destroy, id: school.id

        expect(response).to redirect_to(action: :index)
      end
    end
  end
end
