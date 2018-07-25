# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  login_user

  let(:user) { User.first }

  let(:valid_attributes) do
    { school_id: FactoryBot.create(:school, user: user).id, title: 'MyString' }
  end

  let(:invalid_attributes) do
    { school: nil, title: nil }
  end

  describe 'GET #index' do
    it 'returns a success response' do
      course = FactoryBot.create(:course, user: user)
      get :index, params: {}
      expect(response).to be_success
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      course = FactoryBot.create(:course, user: user)
      get :show, params: { id: course.to_param }
      expect(response).to be_success
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: {}
      expect(response).to be_success
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      course = FactoryBot.create(:course, user: user)
      get :edit, params: { id: course.to_param }
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Course' do
        expect do
          post :create, params: { course: valid_attributes }
        end.to change(Course, :count).by(1)
      end

      it 'redirects to the created course' do
        post :create, params: { course: valid_attributes }
        expect(response).to redirect_to(Course.last)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { course: invalid_attributes }
        expect(response).to be_success
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      it 'redirects to the course' do
        course = FactoryBot.create(:course, user: user)
        put :update, params: { id: course.to_param, course: valid_attributes }
        expect(response).to redirect_to(course)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        course = FactoryBot.create(:course, user: user)
        put :update, params: { id: course.to_param, course: invalid_attributes }
        expect(response).to be_success
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested course' do
      course = FactoryBot.create(:course, user: user)
      expect do
        delete :destroy, params: { id: course.to_param }
      end.to change(Course, :count).by(-1)
    end

    it 'redirects to the courses list' do
      course = FactoryBot.create(:course, user: user)
      delete :destroy, params: { id: course.to_param }
      expect(response).to redirect_to(courses_url)
    end
  end
end
