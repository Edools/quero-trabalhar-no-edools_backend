require 'rails_helper'

if defined?(ActionController::UrlGenerationError)
  ExpectedRoutingError = ActionController::UrlGenerationError
else
  ExpectedRoutingError = ActionController::RoutingError
end

RSpec.describe StudentCoursesController, type: :controller do
  describe "GET index" do
    subject { get :index }
    it "renders the index template" do
      get :index
      expect(subject).to render_template(:index)
      expect(subject).to render_template("index")
      expect(subject).to render_template("student_courses/index")
    end

    it "does not render a different template" do
      expect(subject).to_not render_template("student_courses/show")
    end
  end

  describe "GET #show" do
    it "assigns the requested contact to @student_course" do
      student_course = create(:student_course)
      get :show, params: { id: student_course.id }
      expect(response.status).to eq(200)
    end

    it "renders the #show view" do
      student_course = create(:student_course)
      get :show, params: { id: student_course.id }
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
      student_course = create(:student_course)
      get :edit, params: { id: student_course.id }
      expect(response).to render_template(:edit)
    end

    it "requires the :id parameter" do
      expect { get :edit }.to raise_error(ExpectedRoutingError)
    end
  end

  describe 'POST #create' do
    subject { post :create, :params => { :student_course => {:active => true, :student_id => create(:student), :course_id => create(:course) } } }

    it "redirects to student_course_url(@student_course)" do
      expect(subject).to redirect_to(student_course_url(assigns(:student_course)))
    end

    it "redirects_to :action => :show" do
      expect(subject).to redirect_to :action => :show,
        :id => assigns(:student_course).id
    end

    it "redirects_to(@student_course)" do
      expect(subject).to redirect_to(assigns(:student_course))
    end

    it "redirects_to /student_courses/:id" do
      expect(subject).to redirect_to("/student_courses/#{assigns(:student_course).id}")
    end
  end

  describe 'PUT #update' do
    before :each do
      @student_course = create(:student_course, active: true)
    end

    it "responds to PUT" do
      put :update, params: { id: @student_course.id, student_course: attributes_for(:student_course) }
      expect(subject).to redirect_to :action => :show,
        :id => assigns(:student_course).id
    end

    it "requires the :id parameter" do
      expect { put :update }.to raise_error(ExpectedRoutingError)
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @student_course = create(:student_course)
    end

    it "deletes the student_course" do
      expect{
        delete :destroy, params: { id: @student_course.id }
      }.to change(StudentCourse, :count).by(-1)
    end

    it "requires the :id parameter" do
      expect { delete :destroy }.to raise_error(ExpectedRoutingError)
    end

    it "redirects to student_courses#index" do
      delete :destroy, params: { id: @student_course.id }
      expect(response).to redirect_to student_courses_url
    end
  end

  describe "#willerror" do
    it "cannot be called" do
      expect { get :willerror }.to raise_error(ExpectedRoutingError)
    end
  end
end
