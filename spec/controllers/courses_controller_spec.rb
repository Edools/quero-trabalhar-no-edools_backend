require 'rails_helper'

if defined?(ActionController::UrlGenerationError)
  ExpectedRoutingError = ActionController::UrlGenerationError
else
  ExpectedRoutingError = ActionController::RoutingError
end

RSpec.describe CoursesController, type: :controller do
  describe "GET index" do
    subject { get :index }
    it "renders the index template" do
      get :index
      expect(subject).to render_template(:index)
      expect(subject).to render_template("index")
      expect(subject).to render_template("courses/index")
    end

    it "does not render a different template" do
      expect(subject).to_not render_template("courses/show")
    end
  end

  describe "GET #show" do
    it "assigns the requested contact to @course" do
      course = create(:course)
      get :show, params: { id: course.id }
      expect(response.status).to eq(200)
    end

    it "renders the #show view" do
      course = create(:course)
      get :show, params: { id: course.id }
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
      course = create(:course)
      get :edit, params: { id: course.id }
      expect(response).to render_template(:edit)
    end

    it "requires the :id parameter" do
      expect { get :edit }.to raise_error(ExpectedRoutingError)
    end
  end

  describe 'POST #create' do
    subject { post :create, :params => { :course => attributes_for(:course) } }

    it "redirects to course_url(@course)" do
      expect(subject).to redirect_to(course_url(assigns(:course)))
    end

    it "redirects_to :action => :show" do
      expect(subject).to redirect_to :action => :show,
        :id => assigns(:course).id
    end

    it "redirects_to(@course)" do
      expect(subject).to redirect_to(assigns(:course))
    end

    it "redirects_to /courses/:id" do
      expect(subject).to redirect_to("/courses/#{assigns(:course).id}")
    end
  end

  describe 'PUT #update' do
    before :each do
      @course = create(:course, tittle: "updatetittle")
    end

    it "responds to PUT" do
      put :update, params: { id: @course.id, course: attributes_for(:course) }
      expect(subject).to redirect_to :action => :show,
        :id => assigns(:course).id
    end

    it "requires the :id parameter" do
      expect { put :update }.to raise_error(ExpectedRoutingError)
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @course = create(:course)
    end

    it "deletes the course" do
      expect{
        delete :destroy, params: { id: @course.id }
      }.to change(Course,:count).by(-1)
    end

    it "requires the :id parameter" do
      expect { delete :destroy }.to raise_error(ExpectedRoutingError)
    end

    it "redirects to courses#index" do
      delete :destroy, params: { id: @course.id }
      expect(response).to redirect_to courses_url
    end
  end

  describe "#willerror" do
    it "cannot be called" do
      expect { get :willerror }.to raise_error(ExpectedRoutingError)
    end
  end
end
