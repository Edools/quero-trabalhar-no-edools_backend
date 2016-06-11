require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  describe 'GET #index' do
    let(:students) { FactoryGirl.create_list(:student, 3) }

    it 'assign students to @students' do
      get :index
      expect(assigns[:students]).to match_array(students)
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
    it 'assigns a new Student to @student' do
      get :new
      expect(assigns[:student]).to be_a_new(Student)
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
      let(:student) { FactoryGirl.attributes_for(:student) }

      it 'create student' do
        expect {
          post :create, student: student
        }.to change(Student, :count).by(1)
      end

      it 'redirect to student details (show)' do
        post :create, student: student
        expect(response).to redirect_to(student_path(Student.last))
      end

      it 'returns a http status redirect' do
        post :create, student: student
        expect(response).to have_http_status(:redirect)
      end
    end

    context 'with invalid params' do
      let(:invalid_student) { FactoryGirl.attributes_for(:student, name: nil) }

      it 'dont create student' do
        expect {
          post :create, student: invalid_student
        }.to_not change(Student, :count)
      end

      it 'render new template' do
        post :create, student: invalid_student
        expect(response).to render_template(:new)
      end

      it 'returns a http status ok' do
        post :create, student: invalid_student
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET #show' do
    context 'when student exist' do
      let(:student) {FactoryGirl.create(:student)}
      let(:courses) {FactoryGirl.create_list(:course, 3)}
      it 'assigns loaded student to @student' do
        get :show, id: student.id
        expect(assigns[:student]).to eq(student)
      end

      it 'assigns courses to @courses' do
        get :show, id: student.id
        expect(assigns[:courses]).to match_array(courses)
      end

      it 'render template show' do
        get :show, id: student.id
        expect(response).to render_template(:show)
      end

      it 'return http status ok' do
        get :show, id: student.id
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when student do not exist' do
      it 'Raise a ActiveRecord::RecordNotFound error' do
        expect {
          get :show, id: -9999
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe 'GET #edit' do
    context 'when student exist' do
      let(:student) {FactoryGirl.create(:student)}
      it 'assigns loaded student to @student' do
        get :edit, id: student.id
        expect(assigns[:student]).to eq(student)
      end

      it 'render template edit' do
        get :edit, id: student.id
        expect(response).to render_template(:edit)
      end

      it 'return http status ok' do
        get :edit, id: student.id
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when student do not exist' do
      it 'Raise a ActiveRecord::RecordNotFound error' do
        expect {
          get :edit, id: -9999
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe 'PUT #update' do
    context 'when student exist' do
      context 'with valid params' do
        let(:student) {FactoryGirl.create(:student)}
        let(:attributes) { FactoryGirl.attributes_for(:student) }
        it 'update student attributes' do
          put :update, id: student.id, student: attributes
          student.reload
          expect(student.name).to eq(attributes[:name])
        end

        it 'redirect to student details (show)' do
          put :update, id: student.id, student: attributes
          expect(response).to redirect_to(student_path(student))
        end

        it 'have http status redirect' do
          put :update, id: student.id, student: attributes
          expect(response).to have_http_status(:redirect)
        end
      end

      context 'with invalid params' do
        let(:student) {FactoryGirl.create(:student)}
        let(:invalid_attributes) { FactoryGirl.attributes_for(:student, name: nil) }
        it 'not update student attributes' do
          expect {
            put :update, id: student.id, student: invalid_attributes
          }.to_not change(student, :name)
        end

        it 'render edit view' do
          put :update, id: student.id, student: invalid_attributes
          expect(response).to render_template(:edit)
        end

        it 'have http status ok' do
          put :update, id: student.id, student: invalid_attributes
          expect(response).to have_http_status(:ok)
        end
      end
    end

    context 'when student not exist' do
      it 'Raise a ActiveRecord::RecordNotFound error' do
        expect {
          get :edit, id: -9999
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when student exist' do
      let(:student) { FactoryGirl.create(:student) }
      it 'remove student from database' do
        student
        expect {
          delete :destroy, id: student.id
        }.to change(Student, :count).by(-1)
      end

      it 'redirect to students listing' do
        delete :destroy, id: student.id
        expect(response).to redirect_to(students_path)
      end
    end
    context 'when student not exist' do
      it 'Raise a ActiveRecord::RecordNotFound error' do
        expect {
          delete :destroy, id: -9999
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe 'GET #enroll' do
    let(:student) { FactoryGirl.create(:student) }
    let(:course) { FactoryGirl.create(:course) }

    it 'assign student to @student' do
      get :enroll, id: student.id, course_id: course.id
      expect(assigns[:student]).to eq(student)
    end

    it 'it redirect to student show' do
      get :enroll, id: student.id, course_id: course.id
      expect(response).to redirect_to(student_path(student))
    end

    it 'enroll student on course' do
      get :enroll, id: student.id, course_id: course.id
      student.reload
      expect(student.courses).to include(course)
    end
  end

  describe 'GET #unenroll' do
    let(:student) { FactoryGirl.create(:student) }
    let(:course) { FactoryGirl.create(:course) }

    before do
      student.courses << course
    end

    it 'assign student to @student' do
      get :unenroll, id: student.id, course_id: course.id
      expect(assigns[:student]).to eq(student)
    end

    it 'it redirect to student show' do
      get :unenroll, id: student.id, course_id: course.id
      expect(response).to redirect_to(student_path(student))
    end

    it 'unenroll student on course' do
      get :unenroll, id: student.id, course_id: course.id
      student.reload
      expect(student.courses).to_not include(course)
    end
  end
end
