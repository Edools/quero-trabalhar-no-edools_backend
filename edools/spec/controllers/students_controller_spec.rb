require 'rails_helper'

RSpec.describe StudentsController, type: :controller do

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
      expect(assigns(:students)).to be_empty
    end
  end

  describe "Student CRUD", :type => :controller do
    it "creates a student and then destroys it" do
      get :new, {school_id: @school.id}
      expect(response).to be_success
      expect(response).to render_template(:new)

      post :create, {school_id: @school.id, student: attributes_for(:student, school_id: @school.id)}
      expect(Student.count).to eq(1)
      expect(@school.reload.students.size).to eq(1)
      expect(response).to redirect_to(school_path(@school.id))

      @student = @school.students.first

      delete :destroy, {school_id: @school.id, id: @student.id}
      expect(Student.count).to eq(0)
      expect(@school.reload.students.size).to eq(0)
      expect(response).to redirect_to(school_path(@school.id))
    end

    it "renders the student's page" do
      @student = create(:student)

      get :show, {school_id: @school.id, id: @student.id}
      expect(response).to be_success
      expect(assigns(:student)).to eq(@student)
      expect(response).to render_template(:show)
    end

    it "renders the student's editing page and updates the student" do
      @student = create(:student)

      get :edit, {school_id: @school.id, id: @student.id}
      expect(response).to be_success
      expect(assigns(:student)).to eq(@student)
      expect(response).to render_template(:edit)

      patch :update, {school_id: @school.id, id: @student.id, student: attributes_for(:student, name: "updated", school_id: @school.id)}
      expect(@student.reload.name).to eq("updated")
      expect(response).to redirect_to(school_path(@school.id))
    end
  end

end
