require 'rails_helper'

RSpec.describe CoursesController, type: :controller do

  before(:all) do
    DatabaseCleaner.start
    @school = create(:school)
  end

  after(:all) do
    DatabaseCleaner.clean
  end

  describe "GET index", :type => :controller do
    it "renders the index template" do
      get :index, {school_id: @school.id}
      expect(response).to be_success
      expect(response).to render_template(:index)
    end

    it "assigns @courses" do
      get :index, {school_id: @school.id}
      expect(assigns(:courses)).to be_empty
    end
  end

  describe "Course CRUD", :type => :controller do
    it "creates a course and then destroys it" do
      get :new, {school_id: @school.id}
      expect(response).to be_success
      expect(response).to render_template(:new)

      post :create, {school_id: @school.id, course: attributes_for(:course, school_id: @school.id)}
      expect(Course.count).to eq(1)
      expect(@school.reload.courses.size).to eq(1)
      expect(response).to redirect_to(school_path(@school.id))

      @course = @school.courses.first

      delete :destroy, {school_id: @school.id, id: @course.id}
      expect(Course.count).to eq(0)
      expect(@school.reload.courses.size).to eq(0)
      expect(response).to redirect_to(school_path(@school.id))
    end

    it "renders the course's page" do
      @course = create(:course)

      get :show, {school_id: @school.id, id: @course.id}
      expect(response).to be_success
      expect(assigns(:course)).to eq(@course)
      expect(response).to render_template(:show)
    end

    it "renders the course's editing page and updates the course" do
      @course = create(:course)

      get :edit, {school_id: @school.id, id: @course.id}
      expect(response).to be_success
      expect(assigns(:course)).to eq(@course)
      expect(response).to render_template(:edit)

      patch :update, {school_id: @school.id, id: @course.id, course: attributes_for(:course, title: "updated", school_id: @school.id)}
      expect(@course.reload.title).to eq("updated")
      expect(response).to redirect_to(school_path(@school.id))
    end
  end

end
