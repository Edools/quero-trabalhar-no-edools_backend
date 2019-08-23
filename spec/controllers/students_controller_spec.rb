require 'rails_helper'

if defined?(ActionController::UrlGenerationError)
  ExpectedRoutingError = ActionController::UrlGenerationError
else
  ExpectedRoutingError = ActionController::RoutingError
end

RSpec.describe StudentsController, type: :controller do
  describe "GET index" do
    subject { get :index }
    it "renders the index template" do
      get :index
      expect(subject).to render_template(:index)
      expect(subject).to render_template("index")
      expect(subject).to render_template("students/index")
    end

    it "does not render a different template" do
      expect(subject).to_not render_template("students/show")
    end
  end

  describe "GET #show" do
    it "assigns the requested contact to @student" do
      student = create(:student)
      get :show, params: { id: student.id }
      expect(response.status).to eq(200)
    end

    it "renders the #show view" do
      student = create(:student)
      get :show, params: { id: student.id }
      expect(response).to render_template(:show)
    end

    it "requires the :id parameter" do
      expect { get :show }.to raise_error(ExpectedRoutingError)
    end
  end

  describe "GET #new" do
    it "responds to GET" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "GET #edit" do
    it "responds to EDIT" do
      student = create(:student)
      get :edit, params: { id: student.id }
      expect(response).to render_template(:edit)
    end

    it "requires the :id parameter" do
      expect { get :edit }.to raise_error(ExpectedRoutingError)
    end
  end

  describe 'POST #create' do
    subject { post :create, :params => { :student => attributes_for(:student) } }

    it "redirects to student_url(@student)" do
      expect(subject).to redirect_to(student_url(assigns(:student)))
    end

    it "redirects_to :action => :show" do
      expect(subject).to redirect_to :action => :show,
        :id => assigns(:student).id
    end

    it "redirects_to(@student)" do
      expect(subject).to redirect_to(assigns(:student))
    end

    it "redirects_to /students/:id" do
      expect(subject).to redirect_to("/students/#{assigns(:student).id}")
    end
  end

  describe 'PUT #update' do
    before :each do
      @student = create(:student, name: "updatename")
    end

    it "responds to PUT" do
      put :update, params: { id: @student.id, student: attributes_for(:student) }
      expect(subject).to redirect_to :action => :show,
        :id => assigns(:student).id
    end

    it "requires the :id parameter" do
      expect { put :update }.to raise_error(ExpectedRoutingError)
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @student = create(:student)
    end

    it "deletes the student" do
      expect{
        delete :destroy, params: { id: @student.id }
      }.to change(Student, :count).by(-1)
    end

    it "requires the :id parameter" do
      expect { delete :destroy }.to raise_error(ExpectedRoutingError)
    end

    it "redirects to students#index" do
      delete :destroy, params: { id: @student.id }
      expect(response).to redirect_to students_url
    end
  end

  describe "#willerror" do
    it "cannot be called" do
      expect { get :willerror }.to raise_error(ExpectedRoutingError)
    end
  end
end
