require 'rails_helper'

RSpec.describe UserCourseRegistrationsController, type: :controller do
  include Devise::Test::ControllerHelpers

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @current_user_admin = create(:admin)
    @current_user = create(:user)
  end

  describe "GET #index" do
    context "user is admin" do
      it "returns http success" do
        sign_in @current_user_admin
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    context "user isn't admin" do
      it "returns http success" do
        sign_in @current_user
        get :index
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "POST #create" do
    context 'user is admin' do
      before(:each) do
        sign_in @current_user_admin
        request.env["HTTP_ACCEPT"] = 'application/json'
        @school = create(:school, user: @current_user_admin)
        @course = create(:course, user: @current_user_admin, school: @school)
        @user_course_attributes = attributes_for(:user_course_registration, 
                                                  user_id: @current_user_admin.id, 
                                                  course_id: @course.id
                                                )
        post :create, params: { user_course_registration: @user_course_attributes }
      end
        
      it 'redirect to show' do
        expect(response.body).to include('id')
      end

      it 'create school with attributes' do
        expect(UserCourseRegistration.last.user).to eql(@current_user_admin)
        expect(UserCourseRegistration.last.course).to eql(@course)
      end
    end
  end

  describe "DELETE #destroy" do
    context 'user is admin deleting invites for standart users' do
      before(:each) do
        @school = create(:school, user: @current_user_admin)
        @course = create(:course, user: @current_user_admin, school: @school)
        @user_course = create(:user_course_registration, user_id: @current_user.id, course_id: @course.id)
        request.env["HTTP_ACCEPT"] = 'application/json'
        sign_in @current_user_admin
      end

      it "returns http success when try delete invite to standart user" do
        delete :destroy, params: { id: @user_course.id } 
        expect(response).to have_http_status(302)
      end

      it 'clear invite for user on db' do
        expect do
          delete :destroy, params: { id: @user_course.id } 
        end.to change { UserCourseRegistration.count }.by(-1)
      end
    end

    context 'admin deleting invite admins' do
      before(:each) do
        @school = create(:school, user: @current_user_admin)
        @course = create(:course, user: @current_user_admin, school: @school)
        @user_course = create(:user_course_registration, user: @current_user_admin, course: @course)
        request.env["HTTP_ACCEPT"] = 'application/json'
        sign_in @current_user_admin
      end

      it "returns http success when try delete invite to other user" do
        delete :destroy, params: { id: @user_course.id } 
        expect(response).to have_http_status(302)
      end

      it 'clear invite for user on db' do
        expect do
          delete :destroy, params: { id: @user_course.id } 
        end.to change { UserCourseRegistration.count }.by(-1)
      end
    end

    context 'user is not admin trying delete invite for other user' do
      before(:each) do
        @school = create(:school, user: @current_user_admin)
        @course = create(:course, user: @current_user_admin, school: @school)
        @user_course = create(:user_course_registration, user: @current_user_admin, course: @course)
        request.env["HTTP_ACCEPT"] = 'application/json'
        sign_in @current_user
      end

      it "returns http redirect for root when try delete invite to other user" do
        delete :destroy, params: { id: @user_course.id } 
        expect(response).to redirect_to('/')
      end

      it 'clear invite for user on db' do
        expect do
          delete :destroy, params: { id: @user_course.id } 
        end.to change { UserCourseRegistration.count }.by(0)
      end
    end
  end


  context 'user is not admin trying delete their own invites' do
    before(:each) do
      @school = create(:school, user: @current_user_admin)
      @course = create(:course, user: @current_user_admin, school: @school)
      request.env["HTTP_ACCEPT"] = 'application/json'
      sign_in @current_user
    end

    it "returns http redirect when try delete invite their own invite" do
      @user_course = create(:user_course_registration, user: @current_user, course: @course)
      delete :destroy, params: { id: @user_course.id } 

      expect(response).to have_http_status(302)
    end

    it 'clear invite for user on db' do

      expect do
        @user_course = create(:user_course_registration, user: @current_user, course: @course)
        delete :destroy, params: { id: @user_course.id } 
      end.to change { UserCourseRegistration.count }.by(0)
    end
  end
end
