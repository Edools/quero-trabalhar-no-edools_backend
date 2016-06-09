require 'rails_helper'

RSpec.describe SchoolsController, type: :controller do

  describe "GET index", :type => :controller do
    it "renders the index template" do
      get :index
      #expect(response).to have_http_status(200)
      expect(response).to be_success
      expect(response).to render_template(:index)
    end

    it "assigns @schools" do
      get :index
      expect(assigns(:schools)).to be_empty
    end
  end


  describe "GET show", :type => :controller do
    it "renders the School's page" do
      school = create(:school)
      get :show, id: school.id
      expect(response).to be_success
      expect(assigns(:school)).to eq(school)
      expect(response).to render_template(:show)
    end
  end


  describe "GET new", :type => :controller do
    it "renders the new School page" do
      get :new
      expect(response).to be_success
      expect(response).to render_template(:new)
    end
  end


  describe "GET edit", :type => :controller do
    it "renders the School's editing page" do
      school = create(:school)
      get :edit, id: school.id
      expect(response).to be_success
      expect(assigns(:school)).to eq(school)
      expect(response).to render_template(:edit)
    end
  end

  describe "School management", :type => :request do
    it "creates a School and redirects to the School's page" do
      get "/schools/new"
      expect(response).to render_template(:new)

      post "/schools", school: attributes_for(:school)

      expect(School.count).to eq(1)

      expect(response).to redirect_to(assigns(:school))
      follow_redirect!

      expect(response).to render_template(:show)
    end
  end

  describe "Update school", :type => :controller do
    it "updates a School and redirects to the School's page" do
      school = create(:school)

      patch :update, id: school.id, school: attributes_for(:school, name: "updated")

      expect(school.reload.name).to eq("updated")
      expect(response).to redirect_to(assigns(:school))
    end
  end

  describe "Delete school", :type => :controller do
    it "deletes a School and redirects to index" do
      school = create(:school)

      delete :destroy, id: school.id

      expect(School.count).to eq(0)
      expect(response).to redirect_to(schools_path)
    end
  end

end
