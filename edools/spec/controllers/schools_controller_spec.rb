require 'rails_helper'

RSpec.describe SchoolsController, type: :controller do

  before(:all) do
    DatabaseCleaner.start
  end

  after(:all) do
    DatabaseCleaner.clean
  end

  describe "GET index", :type => :controller do
    it "renders the index template" do
      get :index
      expect(response).to be_success
      expect(response).to render_template(:index)
    end

    it "assigns @schools" do
      get :index
      expect(assigns(:schools)).to be_empty
    end
  end

  describe "School CRUD", :type => :controller do
    it "renders the school's creating page and creates a school" do
      get :new
      expect(response).to be_success
      expect(response).to render_template(:new)

      post :create, school: attributes_for(:school)
      expect(School.count).to eq(1)
      expect(response).to redirect_to(assigns(:school))
    end

    it "renders the school's page" do
      @school = create(:school)

      get :show, id: @school.id
      expect(response).to be_success
      expect(assigns(:school)).to eq(@school)
      expect(response).to render_template(:show)
    end

    it "renders the school's editing page and updates the school" do
      @school = create(:school)

      get :edit, id: @school.id
      expect(response).to be_success
      expect(assigns(:school)).to eq(@school)
      expect(response).to render_template(:edit)

      patch :update, id: @school.id, school: attributes_for(:school, name: "updated")
      expect(@school.reload.name).to eq("updated")
      expect(response).to redirect_to(assigns(:school))
    end

    it "deletes the school and redirects to index" do
      @school = create(:school)

      delete :destroy, id: @school.id
      expect(School.count).to eq(0)
      expect(response).to redirect_to(schools_path)
    end
  end

  describe "Invalid school" do
    it "should not create a school" do
      post :create, school: attributes_for(:invalid_school)
      expect(School.count).to eq(0)
      expect(response).to have_http_status(400)
      expect(response).to render_template(:new)
    end

    it "should not update a school" do
      @school = create(:school)

      patch :update, id: @school.id, school: attributes_for(:invalid_school, name: "updated")
      expect(@school.reload.name).not_to eq("updated")
      expect(response).to have_http_status(400)
      expect(response).to render_template(:edit)
    end
  end

  describe "Active students" do
    it "should not get active students" do
      @school = create(:school)

      get :active_students, id: @school.id
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:active_students)
    end

    it "should get active students" do
      @school = create(:school)
      @course = @school.courses.create(attributes_for(:course))
      @student = @school.students.create(attributes_for(:student))
      @course.students << @student

      get :active_students, id: @school.id
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:active_students)
    end
  end

end
