require 'rails_helper'

RSpec.describe SchoolsController, type: :controller do

  let(:valid_attributes) { build(:valid_school).attributes }
  let(:invalid_attributes) { build(:invalid_school).attributes }

  let!(:school) { school = create(:valid_school, valid_attributes) }

  describe "GET #index" do
    it "assigns all schools as @schools" do
      get :index, {}
      expect(assigns(:schools)).to eq([school])
    end
  end

  describe "GET #new" do
    it "assigns a new school as @school" do
      get :new, {}
      expect(assigns(:school)).to be_a_new(School)
    end
  end

  describe "GET #edit" do
    it "assigns the requested school as @school" do
      get :edit, {:id => school.to_param}
      expect(assigns(:school)).to eq(school)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new School" do
        expect {
          post :create, {:school => valid_attributes}
        }.to change(School, :count).by(1)
      end

      it "assigns a newly created school as @school" do
        post :create, {:school => valid_attributes}
        expect(assigns(:school)).to be_a(School)
        expect(assigns(:school)).to be_persisted
      end

      it "redirects to the created school" do
        post :create, {:school => valid_attributes}
        expect(response).to redirect_to(School.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved school as @school" do
        post :create, {:school => invalid_attributes}
        expect(assigns(:school)).to be_a_new(School)
      end

      it "re-renders the 'new' template" do
        post :create, {:school => invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {{ name: "New Name" }}

      it "updates the requested school" do
        put :update, {:id => school.to_param, :school => new_attributes}
        school.reload
        expect(school.name).to eql(new_attributes[:name])
      end

      it "assigns the requested school as @school" do
        put :update, {:id => school.to_param, :school => valid_attributes}
        expect(assigns(:school)).to eq(school)
      end

      it "redirects to the school" do
        put :update, {:id => school.to_param, :school => valid_attributes}
        expect(response).to redirect_to(school)
      end
    end

    context "with invalid params" do
      it "assigns the school as @school" do
        put :update, {:id => school.to_param, :school => invalid_attributes}
        expect(assigns(:school)).to eq(school)
      end

      it "re-renders the 'edit' template" do
        put :update, {:id => school.to_param, :school => invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested school" do
      expect {
        delete :destroy, {:id => school.to_param}
      }.to change(School, :count).by(-1)
    end

    it "redirects to the schools list" do
      delete :destroy, {:id => school.to_param}
      expect(response).to redirect_to(schools_url)
    end
  end

end
