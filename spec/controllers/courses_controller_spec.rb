require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  before do
    @school = FactoryGirl.create(:school)
  end

  describe 'GET #index' do
    let(:courses) { FactoryGirl.create_list(:course, 3, school: @school) }

    it 'assign courses to @courses' do
      get :index, school_id: @school.id
      expect(assigns[:courses]).to match_array(courses)
    end

    it 'render index template' do
      get :index, school_id: @school.id
      expect(response).to render_template(:index)
    end

    it 'return http status ok' do
      get :index, school_id: @school.id
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #new' do
    it 'assigns a new Course to @course' do
      get :new, school_id: @school.id
      expect(assigns[:course]).to be_a_new(Course)
    end

    it 'render template new' do
      get :new, school_id: @school.id
      expect(response).to render_template(:new)
    end

    it 'return http status ok' do
      get :new, school_id: @school.id
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let(:course) { FactoryGirl.attributes_for(:course) }

      it 'create course' do
        expect {
          post :create, school_id: @school.id,  course: course
        }.to change(Course, :count).by(1)
      end

      it 'redirect to course details (show)' do
        post :create, school_id: @school.id, course: course
        expect(response).to redirect_to(school_course_path(@school, @school.courses.last))
      end

      it 'returns a http status redirect' do
        post :create, school_id: @school.id, course: course
        expect(response).to have_http_status(:redirect)
      end
    end

    context 'with invalid params' do
      let(:invalid_course) { FactoryGirl.attributes_for(:course, title: nil) }

      it 'dont create course' do
        expect {
          post :create, school_id: @school.id, course: invalid_course
        }.to_not change(Course, :count)
      end

      it 'render new template' do
        post :create, school_id: @school.id, course: invalid_course
        expect(response).to render_template(:new)
      end

      it 'returns a http status ok' do
        post :create, school_id: @school.id, course: invalid_course
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET #show' do
    context 'when course exist' do
      let(:course) {FactoryGirl.create(:course, school: @school)}
      it 'assigns loaded course to @course' do
        get :show, school_id: @school.id, id: course.id
        expect(assigns[:course]).to eq(course)
      end

      it 'render template show' do
        get :show, school_id: @school.id, id: course.id
        expect(response).to render_template(:show)
      end

      it 'return http status ok' do
        get :show, school_id: @school.id, id: course.id
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when course do not exist' do
      it 'Raise a ActiveRecord::RecordNotFound error' do
        expect {
          get :show, school_id: @school.id, id: -9999
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe 'GET #edit' do
    context 'when course exist' do
      let(:course) {FactoryGirl.create(:course, school: @school)}
      it 'assigns loaded course to @course' do
        get :edit, school_id: @school.id, id: course.id
        expect(assigns[:course]).to eq(course)
      end

      it 'render template edit' do
        get :edit, school_id: @school.id, id: course.id
        expect(response).to render_template(:edit)
      end

      it 'return http status ok' do
        get :edit, school_id: @school.id, id: course.id
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when course do not exist' do
      it 'Raise a ActiveRecord::RecordNotFound error' do
        expect {
          get :edit, school_id: @school.id, id: -9999
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe 'PUT #update' do
    context 'when course exist' do
      context 'with valid params' do
        let(:course) {FactoryGirl.create(:course, school: @school)}
        let(:attributes) { FactoryGirl.attributes_for(:course) }
        it 'update course attributes' do
          put :update, school_id: @school.id, id: course.id, course: attributes
          course.reload
          expect(course.title).to eq(attributes[:title])
        end

        it 'redirect to course details (show)' do
          put :update, school_id: @school.id, id: course.id, course: attributes
          expect(response).to redirect_to(school_course_path(@school, course))
        end

        it 'have http status redirect' do
          put :update, school_id: @school.id, id: course.id, course: attributes
          expect(response).to have_http_status(:redirect)
        end
      end

      context 'with invalid params' do
        let(:course) {FactoryGirl.create(:course, school: @school)}
        let(:invalid_attributes) { FactoryGirl.attributes_for(:course, title: nil) }
        it 'not update course attributes' do
          expect {
            put :update, school_id: @school.id, id: course.id, course: invalid_attributes
          }.to_not change(course, :title)
        end

        it 'render edit view' do
          put :update, school_id: @school.id, id: course.id, course: invalid_attributes
          expect(response).to render_template(:edit)
        end

        it 'have http status ok' do
          put :update, school_id: @school.id, id: course.id, course: invalid_attributes
          expect(response).to have_http_status(:ok)
        end
      end
    end

    context 'when course not exist' do
      it 'Raise a ActiveRecord::RecordNotFound error' do
        expect {
          get :edit, school_id: @school.id, id: -9999
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when course exist' do
      let(:course) { FactoryGirl.create(:course, school: @school) }
      it 'remove course from database' do
        course
        expect {
          delete :destroy, school_id: @school.id, id: course.id
        }.to change(Course, :count).by(-1)
      end

      it 'redirect to courses listing' do
        delete :destroy, school_id: @school.id, id: course.id
        expect(response).to redirect_to(school_courses_path(@school))
      end
    end
    context 'when course not exist' do
      it 'Raise a ActiveRecord::RecordNotFound error' do
        expect {
          delete :destroy, school_id: @school.id, id: -9999
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
