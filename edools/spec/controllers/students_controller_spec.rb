require 'rails_helper'


RSpec.describe StudentsController, type: :controller do
  describe "GET #index" do
    let(:students){create_list(:student,5)}

    before(:each) do
      get :index
    end

    it "assigns list @students" do
      expect(assigns(:students)).to eq(students)
    end

  end

  describe "POST #create" do
    before(:each) do
      post :create, student: student_attributes
    end

    context "with valid params" do
      let(:student_attributes) { attributes_for(:student) }
      it "assigns created student as @student" do
        expect(assigns(:student)).to be_a(Student)
      end

      it "redirect to show student" do
        expect(response).to redirect_to action: :show, id: assigns(:student).id
      end
    end

    context "with invalid params" do
      let(:student_attributes) { attributes_for(:invalid_student) }

      it "render to 'new' template" do
        expect(response).to render_template("new")
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

    it "assigns the requested student as @student" do
      expect(assigns(:student)).to be_a_new(Student)
    end
  end

  describe "GET #edit" do
    let(:student) { create(:student) }

    before(:each) do
      get :edit, id: student.id
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "renders the edit template" do
      expect(response).to render_template(:edit)
    end

    it "assigns the requested student as @student" do
      expect(assigns(:student)).to eq(student)
    end
  end

  describe "GET #update" do
    let(:student){create(:student)}
    before(:each) do
      patch :update, id: student.id, student: student_attributes
    end

    context "with valid params" do
      let(:student_attributes) { attributes_for(:student) }
      it "assigns update student as @student" do
        expect(assigns(:student)).to be_a(Student)
      end

      it "redirect to show student" do
        expect(response).to redirect_to action: :show, id: assigns(:student).id
      end
    end

    context "with invalid params" do
      let(:student_attributes){attributes_for(:invalid_student)}
      it "assigns update student as @student" do
        expect(assigns(:student)).to be_a(Student)
      end

      it "re-render to edit student" do
        expect(response).to render_template(:edit)
      end
    end

  end

  describe "GET #destroy" do
    let(:student) { create(:student) }

    before(:each) do
      delete :destroy, id: student.id
    end

    it "destroys the requested student" do
      expect(Student.exists?(student.id)).to be(false)
    end

    it "redirects to the students list" do
      expect(response).to redirect_to(students_path)
    end
  end

end
