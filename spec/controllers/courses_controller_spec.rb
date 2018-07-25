require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
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
        @school = create(:school, user: @current_user_admin)
        @course_attributes = attributes_for(:course, 
                                            school_id: @school.id, 
                                            user_id: @current_user_admin.id)
        sign_in @current_user_admin
        post :create, params: { course: @course_attributes }
      end
      
      it 'redirect to show' do
        expect(response).to have_http_status(302)
        expect(response).to redirect_to("/courses/#{Course.last.id}")
      end

      it 'create course with attributes' do
        expect(Course.last.title).to eql(@course_attributes[:title])
        expect(Course.last.duration).to eql(@course_attributes[:duration])
        expect(Course.last.content).to eql(@course_attributes[:content])
        expect(Course.last.description).to eql(@course_attributes[:description])
        expect(Course.last.price).to eql(@course_attributes[:price])
        expect(Course.last.user).to eql(@current_user_admin)
        expect(Course.last.school_id).to eql(@school.id)
      end
    end

    context 'user is not admin' do
      before(:each) do
        @school = create(:school, user: @current_user_admin)
        @course_attributes = attributes_for(:course, 
                                            user_id: @current_user_admin.id, 
                                            school_id: @school.id)
        sign_in @current_user
      end

      it 'redirect to root' do
        post :create, params: { course: @course_attributes }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to('/')
      end
    end
  end

  describe "GET #show" do
    
    context 'user is admin' do
      before(:each) do
        @school = create(:school, user: @current_user_admin)
        @course = create(:course, user: @current_user_admin, school: @school)
        sign_in @current_user_admin
      end
      it "returns http success" do
        get :show, params: { id: @course.id }
        expect(response).to have_http_status(:success)
      end
    end

    context 'user is not admin' do
      before(:each) do
        @school = create(:school, user: @current_user_admin)
        @course = create(:course, user: @current_user_admin, school: @school)
        sign_in @current_user
      end
      it "returns http success" do
        get :show, params: { id: @course.id }
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "PUT #update" do
    context 'user is admin' do
      before(:each) do
        sign_in @current_user_admin
        @course_attributes = attributes_for(:course)
        @school = create(:school, user: @current_user_admin)
        @course = create(:course, user: @current_user_admin, school: @school)
        put :update, params: { id: @course.id, course: @course_attributes }
      end
      
      it "returns http success" do
        expect(response).to have_http_status(302)
      end

      it "Course has gotten the news attributes" do
        expect(Course.last.title).to eq(@course_attributes[:title])
      end
    end

    context "user is not admin" do
      before(:each) do
        sign_in @current_user
        @course_attributes = attributes_for(:course)
        @school = create(:school, user: @current_user_admin)
        @course = create(:course, user: @current_user_admin, school: @school)
        put :update, params: { id: @course.id, course: @course_attributes }
      end
      it "returns http success" do
        put :update, params: { id: @course.id, course: @course_attributes }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to('/')
      end
    end
  end

  describe "DELETE #destroy" do
    context 'user is admin' do
      before(:each) do
        @school = create(:school, user: @current_user_admin)
        @course = create(:course, user: @current_user_admin, school: @school)
        sign_in @current_user_admin
        delete :destroy, params: { id: @course.id } 
      end

      it "returns http success" do
        expect(response).to have_http_status(302)
        expect(response).to redirect_to('/courses')
      end
    end

    context 'user is not admin' do
      before(:each) do
        @school = create(:school, user: @current_user_admin)
        @course = create(:course, user: @current_user_admin, school: @school)
        sign_in @current_user
        delete :destroy, params: { id: @course.id } 
      end
      it "returns http success" do
        expect(response).to have_http_status(302)
        expect(response).to redirect_to('/')
      end
    end
  end
end
