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
      expect(response).to redirect_to(school_students_path(@school))

      @student = @school.students.first

      delete :destroy, {school_id: @school.id, id: @student.id}
      expect(Student.count).to eq(0)
      expect(@school.reload.students.size).to eq(0)
      expect(response).to redirect_to(school_students_path(@school))

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
      expect(response).to redirect_to(school_students_path(@school))

    end
  end

  describe "Invalid student" do
    it "should not create a student" do
      post :create, {school_id: @school.id, student: attributes_for(:invalid_student, school_id: @school.id)}
      expect(response).to have_http_status(400)
      expect(Student.count).to eq(0)
      expect(@school.reload.students.size).to eq(0)
    end

    it "should not update a student" do
      @student = create(:student)

      patch :update, {school_id: @school.id, id: @student.id, student: attributes_for(:invalid_student, title: "updated", school_id: @school.id)}
      expect(@school.reload.name).not_to eq("updated")
      expect(response).to have_http_status(400)
      expect(response).to render_template(:edit)
    end
  end

end
