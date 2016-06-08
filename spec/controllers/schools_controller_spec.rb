require 'rails_helper'

RSpec.describe SchoolsController, type: :controller do
  render_views
  subject { response }

  let(:valid_attributes) {
    attributes_for(:school)
  }

  let(:invalid_attributes) {
    attributes_for(:school, :empty)
  }

  before { @school = create(:school) }

  describe 'GET #index' do
    before { get :index }
    it { is_expected.to have_http_status(:success) }
    it { is_expected.to render_template :index }
    it('should assigns all schools as @schools') { expect(assigns(:schools)).to match_array([@school]) }
  end

  describe 'GET #show' do
    before { get :show, id: @school }
    it { is_expected.to have_http_status(:success) }
    it { is_expected.to render_template :show }
    it('should assigns the requested school as @school') { expect(assigns(:school)).to eq(@school) }
  end

  describe 'GET #new' do
    before { get :new }
    it { is_expected.to have_http_status(:success) }
    it { is_expected.to render_template :new }
    it('should assigns a new school as @school') { expect(assigns(:school)).to be_a_new(School) }
  end

  describe 'GET #edit' do
    before { get :edit, id: @school }
    it { is_expected.to have_http_status(:success) }
    it { is_expected.to render_template :edit }
    it('should assigns the requested school as @school') { expect(assigns(:school)).to eq(@school) }
  end

  describe 'POST #create' do
    context 'with valid params' do
      subject { post :create, school: valid_attributes }
      it { expect(subject).to have_http_status(:redirect) }
      it { expect(subject).to redirect_to(School.last) }
      it 'creates a new School' do
        expect { subject }.to change(School, :count).by(1)
      end
      it 'sets a flash message' do
        subject
        expect(flash[:notice]).to eq 'Escola foi criado(a) com sucesso.'
      end
    end

    context 'with invalid params' do
      subject { post :create, school: invalid_attributes }
      it { expect(subject).to have_http_status(:success) }
      it { expect(subject).to render_template(:new) }
      it 'should not create a new School' do
        expect { subject }.not_to change(School, :count)
      end
      it 'assigns a newly created but unsaved school as @school' do
        subject
        expect(assigns(:school)).to be_a_new(School)
      end
      it 'sets an alert flash message' do
        subject
        expect(flash[:alert]).to eq 'Escola não pôde ser criado(a).'
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        attributes_for(:school, name: 'New School')
      }
      subject { patch :update, id: @school, school: new_attributes }
      it { expect(subject).to have_http_status(:redirect) }
      it { expect(subject).to redirect_to(@school) }
      it 'updates the requested school' do
        subject
        @school.reload
        expect(@school.name).to eq 'New School'
      end
      it 'sets a flash message' do
        subject
        expect(flash[:notice]).to eq 'Escola foi atualizado(a) com sucesso.'
      end
    end
    context 'with invalid params' do
      subject { patch :update, id: @school, school: invalid_attributes }
      it { expect(subject).to have_http_status(:success) }
      it { expect(subject).to render_template(:edit) }
      it 'sets an alert flash message' do
        subject
        expect(flash[:alert]).to eq 'Escola não pôde ser atualizado(a).'
      end
    end
  end

  describe 'DELETE #destroy' do
    subject { delete :destroy, id: @school }
    it 'destroys the requested school' do
      expect { subject }.to change(School, :count).by(-1)
    end
    it 'redirects to the school list' do
      subject
      expect(response).to redirect_to(schools_url)
    end
  end
end
