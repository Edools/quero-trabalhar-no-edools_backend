require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  render_views
  subject { response }

  let(:valid_attributes) {
    attributes_for(:course).merge({school_id: create(:school).id})
  }

  let(:invalid_attributes) {
    attributes_for(:course, :empty)
  }

  before { @course = create(:course) }

  describe 'GET #index' do
    before { get :index }
    it { is_expected.to have_http_status(:success) }
    it { is_expected.to render_template :index }
    it('should assigns all courses as @courses') { expect(assigns(:courses)).to match_array([@course]) }
  end

  describe 'GET #show' do
    before { get :show, id: @course }
    it { is_expected.to have_http_status(:success) }
    it { is_expected.to render_template :show }
    it('should assigns the requested course as @course') { expect(assigns(:course)).to eq(@course) }
  end

  describe 'GET #new' do
    before { get :new }
    it { is_expected.to have_http_status(:success) }
    it { is_expected.to render_template :new }
    it('should assigns a new course as @course') { expect(assigns(:course)).to be_a_new(Course) }
  end

  describe 'GET #edit' do
    before { get :edit, id: @course }
    it { is_expected.to have_http_status(:success) }
    it { is_expected.to render_template :edit }
    it('should assigns the requested course as @course') { expect(assigns(:course)).to eq(@course) }
  end

  describe 'POST #create' do
    context 'with valid params' do
      subject { post :create, course: valid_attributes }
      it { expect(subject).to have_http_status(:redirect) }
      it { expect(subject).to redirect_to(Course.last) }
      it 'creates a new Course' do
        expect { subject }.to change(Course, :count).by(1)
      end
      it 'sets a flash message' do
        subject
        expect(flash[:notice]).to eq 'Curso foi criado(a) com sucesso.'
      end
    end
    context "with invalid params" do
      subject { post :create, course: invalid_attributes }
      it { expect(subject).to have_http_status(:success) }
      it { expect(subject).to render_template(:new) }
      it 'should not create a new Course' do
        expect { subject }.not_to change(Course, :count)
      end
      it 'assigns a newly created but unsaved course as @course' do
        subject
        expect(assigns(:course)).to be_a_new(Course)
      end
      it 'sets an alert flash message' do
        subject
        expect(flash[:alert]).to eq 'Curso não pôde ser criado(a).'
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        attributes_for(:school, title: 'New Course')
      }
      subject { patch :update, id: @course, course: new_attributes }
      it { expect(subject).to have_http_status(:redirect) }
      it { expect(subject).to redirect_to(@course) }
      it 'updates the requested school' do
        subject
        @course.reload
        expect(@course.title).to eq 'New Course'
      end
      it 'sets a flash message' do
        subject
        expect(flash[:notice]).to eq 'Curso foi atualizado(a) com sucesso.'
      end
    end

    context 'with invalid params' do
      subject { patch :update, id: @course, course: invalid_attributes }
      it { expect(subject).to have_http_status(:success) }
      it { expect(subject).to render_template(:edit) }
      it 'sets an alert flash message' do
        subject
        expect(flash[:alert]).to eq 'Curso não pôde ser atualizado(a).'
      end
    end
  end

  describe 'DELETE #destroy' do
    subject { delete :destroy, id: @course }
    it 'destroys the requested course' do
      expect { subject }.to change(Course, :count).by(-1)
    end
    it 'redirects to the course list' do
      subject
      expect(response).to redirect_to(courses_url)
    end
  end
end
