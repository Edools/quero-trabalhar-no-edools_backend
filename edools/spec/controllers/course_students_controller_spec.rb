require 'rails_helper'


RSpec.describe CourseStudentsController, type: :controller do
  describe "GET #index" do
    let(:course_students){create_list(:course_student,5)}

    before(:each) do
      get :index
    end

    it "assigns list @course_students" do
      expect(assigns(:course_students)).to eq(course_students)
    end

  end

  describe "POST #create" do
    before(:each) do
      post :create, course_student: course_student_attributes
    end

    context "with valid params" do
      let(:course_student_attributes) { attributes_for(:course_student) }
      it "assigns created course_student as @course_student" do
        expect(assigns(:course_student)).to be_a(CourseStudent)
      end

      it "redirect to show course" do
        expect(response).to redirect_to action: :show, id: assigns(:course_student).id
      end
    end

  end

  describe "GET #new" do
    before(:each) do
      get :new
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "renders the edit template" do
      expect(response).to render_template(:new)
    end

    it "assigns the requested course_student as @course_student" do
      expect(assigns(:course_student)).to be_a_new(CourseStudent)
    end
  end

  describe "GET #edit" do
    let(:course_student) { create(:course_student) }

    before(:each) do
      get :edit, id: course_student.id
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "renders the edit template" do
      expect(response).to render_template(:edit)
    end

    it "assigns the requested course as @course_student" do
      expect(assigns(:course_student)).to eq(course_student)
    end
  end



end
