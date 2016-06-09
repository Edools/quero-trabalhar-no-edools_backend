require 'rails_helper'



RSpec.describe SchoolsController, type: :controller do

  describe "GET #index" do
    let(:schools){create_list(:school,5)}

    before(:each) do
      get :index
    end

    it "assigns list @schools" do
      expect(assigns(:schools)).to eq(schools)
    end

  end

  describe "POST #create" do
    before(:each) do
      post :create, school: school_attributes
    end

    context "with valid params" do
      let(:school_attributes) { attributes_for(:school) }
      it "assigns created school as @school" do
        expect(assigns(:school)).to be_a(School)
      end

      it "redirect to show school" do
        expect(response).to redirect_to action: :show, id: assigns(:school).id
      end
    end

    context "with invalid params" do
      let(:school_attributes) { attributes_for(:invalid_school) }

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

    it "assigns the requested school as @school" do
      expect(assigns(:school)).to be_a_new(School)
    end
  end

  describe "GET #edit" do
    let(:school) { create(:school) }

    before(:each) do
      get :edit, id: school.id
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "renders the edit template" do
      expect(response).to render_template(:edit)
    end

    it "assigns the requested school as @school" do
      expect(assigns(:school)).to eq(school)
    end
  end

  describe "GET #update" do
    let(:school){create(:school)}
    before(:each) do
      patch :update, id: school.id, school: school_attributes
    end

    context "with valid params" do
      let(:school_attributes) { attributes_for(:school) }
      it "assigns update school as @school" do
        expect(assigns(:school)).to be_a(School)
      end

      it "redirect to show school" do
        expect(response).to redirect_to action: :show, id: assigns(:school).id
      end
    end

    context "with invalid params" do
      let(:school_attributes){attributes_for(:invalid_school)}
      it "assigns update school as @school" do
        expect(assigns(:school)).to be_a(School)
      end

      it "re-render to edit school" do
        expect(response).to render_template(:edit)
      end
    end

  end

  describe "GET #destroy" do
    let(:school) { create(:school) }

    before(:each) do
      delete :destroy, id: school.id
    end

    it "destroys the requested school" do
      expect(School.exists?(school.id)).to be(false)
    end

    it "redirects to the houses list" do
      expect(response).to redirect_to(schools_path)
    end
  end

end
