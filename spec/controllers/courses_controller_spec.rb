require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  let(:course) { FactoryGirl::create(:course) }
  let(:courses) { FactoryGirl::create_list(:course, 4) }
  let(:valid_attributes) { FactoryGirl::attributes_for(:course) }
  let(:invalid_attributes) { FactoryGirl::attributes_for(:course, title: nil) }

  describe '#index' do

    before(:each) { get :index }

    context 'assignments' do
      it 'assigns all courses' do
        expect(assigns(:courses)).to match_array(courses)
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
      it 'assigns a new course' do
        expect(assigns(:course)).to be_a_new Course
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
      it 'increases courses count' do
        expect do
          post :create, course: valid_attributes
        end.to change(Course, :count).by(1)
      end

      it 'redirects to courses#index' do
        post :create, course: valid_attributes

        expect(response).to redirect_to(action: :index)
      end
    end

    context 'failure' do
      it 'does not change courses count' do
        expect do
          post :create, course: invalid_attributes
        end.not_to change(Course, :count)
      end

      it 're-enders action new' do
        post :create, course: invalid_attributes

        expect(response).to render_template(:new)
      end
    end
  end

  describe '#show' do
    before(:each) { get :show, id: course.id }

    context 'assignments' do
      it 'assigns course by its id' do
        expect(assigns(:course)).to eq(course)
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
    before(:each) { course.save }

    context 'success' do
      it 'decreases courses count' do
        expect do
          delete :destroy, id: course.id
        end.to change(Course, :count).by(-1)
      end

      it 'redirects to index' do
        delete :destroy, id: course.id

        expect(response).to redirect_to(action: :index)
      end
    end
  end
end
