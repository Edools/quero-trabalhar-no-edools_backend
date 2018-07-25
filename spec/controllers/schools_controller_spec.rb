require 'rails_helper'

RSpec.describe SchoolsController, type: :controller do
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
        @school_attributes = attributes_for(:school, user_id: @current_user_admin.id)
        sign_in @current_user_admin
        post :create, params: { school: @school_attributes }
      end
      
      it 'redirect to show' do
        expect(response).to have_http_status(302)
        expect(response).to redirect_to("/schools/#{School.last.id.to_s}")
      end

      it 'create school with attributes' do
        expect(School.last.name).to eql(@school_attributes[:name])
        expect(School.last.owner_email).to eql(@school_attributes[:owner_email])
        expect(School.last.pitch).to eql(@school_attributes[:pitch])
        expect(School.last.subdomain).to eql(@school_attributes[:subdomain])
        expect(School.last.user).to eql(@current_user_admin)
      end
    end

    context 'user is not admin' do
      before(:each) do
        @school = create(:school, user: @current_user_admin)
        @school_attributes = attributes_for(:school, user_id: @current_user_admin.id)
        sign_in @current_user
      end

      it 'redirect to root' do
        post :create, params: { school: @school_attributes }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to('/')
      end
    end
  end

  describe "GET #show" do
    context 'user is admin' do
      before(:each) do
        @school = create(:school, user: @current_user_admin)
        sign_in @current_user_admin
      end

      it "returns http success" do
        get :show, params: { id: @school.id }
        expect(response).to have_http_status(:success)
      end
    end

    context 'user is not admin' do
      before(:each) do
        @school = create(:school, user: @current_user_admin)
        sign_in @current_user
      end
      it "returns http success" do
        get :show, params: { id: @school.id }
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "PUT #update" do
    context 'user is admin' do
      before(:each) do
        sign_in @current_user_admin
        @school_attributes = attributes_for(:school)
        @school = create(:school, user: @current_user_admin)
        put :update, params: { id: @school.id, school: @school_attributes }
      end
      
      it "returns http success" do
        expect(response).to have_http_status(302)
      end

      it "School has gotten the news attributes" do
        expect(School.last.name).to eql(@school_attributes[:name])
        expect(School.last.owner_email).to eql(@school_attributes[:owner_email])
        expect(School.last.pitch).to eql(@school_attributes[:pitch])
        expect(School.last.subdomain).to eql(@school_attributes[:subdomain])
        expect(School.last.user).to eql(@current_user_admin)
      end
    end

    context "user is not admin" do
      before(:each) do
        sign_in @current_user
        @school_attributes = attributes_for(:school)
        @school = create(:school, user: @current_user_admin)
        put :update, params: { id: @school.id, school: @school_attributes }
      end
      it "returns http success" do
        expect(response).to have_http_status(302)
        expect(response).to redirect_to('/')
      end
    end
  end

  describe "DELETE #destroy" do
    context 'user is admin' do
      before(:each) do
        sign_in @current_user_admin
        @school = create(:school, user: @current_user_admin)
        delete :destroy, params: { id: @school.id } 
      end
      it "returns http success" do
        expect(response).to have_http_status(302)
        expect(response).to redirect_to('/schools')
      end
    end

    context 'user is not admin' do
      before(:each) do
        @school = create(:school, user: @current_user_admin)
        sign_in @current_user
        delete :destroy, params: { id: @school.id } 
      end
      it "returns http success" do
        expect(response).to have_http_status(302)
        expect(response).to redirect_to('/')
      end
    end
  end

  describe '#GET csv_school' do
    context 'user is admin' do
      it 'response' do
        sign_in @current_user_admin
        get :csv_schools, format: :csv
        expect(response).to have_http_status(200)
      end
    end

    context 'user is not admin' do
      it 'response' do
        sign_in @current_user
        get :csv_schools, format: :csv
        expect(response).to have_http_status(302)
        expect(response).to redirect_to('/')
      end
    end
  end
end
