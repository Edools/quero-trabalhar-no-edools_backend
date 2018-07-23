require 'rails_helper'

RSpec.describe SchoolsController, type: :controller do

  let(:valid_attributes) {
    { name: 'MyString', pitch: 'MyString', subdomain: 'MyString' }
  }

  let(:invalid_attributes) {
    { name: nil, pitch: nil, subdomain: nil }
  }

  login_user

  describe "GET #index" do
    it "returns a success response" do
      school = FactoryBot.create(:school, user: User.first)
      get :index, params: {}
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      school = FactoryBot.create(:school, user: User.first)
      get :show, params: {id: school.to_param}
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      school = FactoryBot.create(:school, user: User.first)
      get :edit, params: {id: school.to_param}
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new School" do
        expect {
          post :create, params: {school: valid_attributes}
        }.to change(School, :count).by(1)
      end

      it "redirects to the created school" do
        post :create, params: {school: valid_attributes}
        expect(response).to redirect_to(School.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {school: invalid_attributes}
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "redirects to the school" do
        school = FactoryBot.create(:school, user: User.first)
        put :update, params: {id: school.to_param, school: valid_attributes}
        expect(response).to redirect_to(school)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        school = FactoryBot.create(:school, user: User.first)
        put :update, params: {id: school.to_param, school: invalid_attributes}
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested school" do
      school = FactoryBot.create(:school, user: User.first)
      expect {
        delete :destroy, params: {id: school.to_param}
      }.to change(School, :count).by(-1)
    end

    it "redirects to the schools list" do
      school = FactoryBot.create(:school, user: User.first)
      delete :destroy, params: {id: school.to_param}
      expect(response).to redirect_to(schools_url)
    end
  end
end
