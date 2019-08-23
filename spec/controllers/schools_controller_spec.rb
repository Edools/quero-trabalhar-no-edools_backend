require 'rails_helper'

if defined?(ActionController::UrlGenerationError)
  ExpectedRoutingError = ActionController::UrlGenerationError
else
  ExpectedRoutingError = ActionController::RoutingError
end

RSpec.describe SchoolsController, type: :controller do
  describe "GET index" do
    subject { get :index }
    it "renders the index template" do
      get :index
      expect(subject).to render_template(:index)
      expect(subject).to render_template("index")
      expect(subject).to render_template("schools/index")
    end

    it "does not render a different template" do
      expect(subject).to_not render_template("schools/show")
    end
  end

  describe "GET #show" do
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
      school = create(:school)
      get :edit, params: { id: school.id }
      expect(response).to render_template(:edit)
    end

    it "requires the :id parameter" do
      expect { get :edit }.to raise_error(ExpectedRoutingError)
    end
  end

  describe 'POST #create' do
    subject { post :create, :params => { :school => attributes_for(:school) } }

    it "redirects to school_url(@school)" do
      expect(subject).to redirect_to(school_url(assigns(:school)))
    end

    it "redirects_to :action => :show" do
      expect(subject).to redirect_to :action => :show,
        :id => assigns(:school).id
    end

    it "redirects_to(@school)" do
      expect(subject).to redirect_to(assigns(:school))
    end

    it "redirects_to /schools/:id" do
      expect(subject).to redirect_to("/schools/#{assigns(:school).id}")
    end
  end

  describe 'PUT #update' do
    before :each do
      @school = create(:school, name: "updatename")
    end

    it "responds to PUT" do
      put :update, params: { id: @school.id, school: attributes_for(:school) }
      expect(subject).to redirect_to :action => :show,
        :id => assigns(:school).id
    end

    it "requires the :id parameter" do
      expect { put :update }.to raise_error(ExpectedRoutingError)
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @school = create(:school)
    end

    it "deletes the school" do
      expect{
        delete :destroy, params: { id: @school.id }
      }.to change(School,:count).by(-1)
    end

    it "requires the :id parameter" do
      expect { delete :destroy }.to raise_error(ExpectedRoutingError)
    end

    it "redirects to schools#index" do
      delete :destroy, params: { id: @school.id }
      expect(response).to redirect_to schools_url
    end
  end

  describe "#willerror" do
    it "cannot be called" do
      expect { get :willerror }.to raise_error(ExpectedRoutingError)
    end
  end
end
