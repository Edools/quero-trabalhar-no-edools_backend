require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  let(:school) { create(:school) }

  describe 'GET index' do
    it 'matches course array' do
      courses = create_list(:course, 2, school: school)

      get :index, school_id: school.id

      expect(assigns(:courses)).to match_array(courses)
    end

    context 'when params title is present' do
      it 'does return the searched course' do
        school = create(:school)
        courses = create_list(:course, 2, school: school)
        course  = create(:course, title: 'Simple title', school: school)

        get :index, title: 'Simple title', school_id: school.id

        expect(assigns(:courses).count).to eq(1)
        expect(assigns(:courses)).to match_array([course])
      end

      it 'does return nothing when has no course matched' do
        school = create(:school)
        courses = create_list(:course, 2, school: school)
        course  = create(:course, title: 'Simple title', school: school)

        get :index, title: 'wrong title', school_id: school.id

        expect(assigns(:courses).count).to eq(0)
        expect(assigns(:courses)).not_to match_array([course])
      end
    end
  end

  describe 'GET new' do
    it 'creates a new instance of Course' do
      get :new, school_id: school.id

      expect(assigns(:course)).to be_instance_of(Course)
    end
  end

  describe 'POST create' do
    context 'when valid' do
      it 'create a new Course' do
        valid_params = attributes_for(:course)

        expect do
          post :create, school_id: school.id, course: valid_params
        end.to change { Course.count }.by(1)
      end
    end

    context 'when invalid' do
      it 'dont create a new Course' do
        invalid_params = attributes_for(:course, title: '')

        expect do
          post :create, school_id: school.id, course: invalid_params
        end.to change { Course.count }.by(0)
      end
    end
  end

  describe 'GET edit' do
    it 'creates a new instance of School' do
      course = create(:course)

      get :edit, school_id: school.id, id: course.id

      expect(assigns(:course)).to be_instance_of(Course)
    end
  end

  describe 'PUT update' do
    context 'when valid' do
      it 'updates the desired School' do
        course = create(:course)
        valid_params = attributes_for(:course, title: 'New course')

        put :update, school_id: school.id, id: course.id, course: valid_params

        expect(course.reload.title).to eq('New course')
      end
    end

    context 'when invalid' do
      it 'dont update the desired School' do
        course = create(:course)
        invalid_params = attributes_for(:course, title: '')

        put :update, school_id: school.id, id: course.id, course: invalid_params

        expect(course.reload.title).not_to eq('')
      end
    end
  end

  describe 'GET show' do
    it 'assign @school as a specific School' do
      course = create(:course)

      get :show, id: course.id, school_id: school.id

      expect(assigns(:course)).to eq(course)
    end
  end

  describe 'DELETE destroy' do
    it 'destroys a specific School on db' do
      course = create(:course)

      expect do
        delete :destroy, school_id: school.id, id: course.id
      end.to change { Course.count }.by(-1)
    end
  end
end
