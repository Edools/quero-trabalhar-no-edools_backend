require 'rails_helper'



RSpec.describe CoursesController, type: :controller do
  describe "GET #index" do
    let(:courses){create_list(:course,5)}

    before(:each) do
      get :index
    end

    it "assigns list @courses" do
      expect(assigns(:courses)).to eq(courses)
    end

  end

  describe "POST #create" do
    before(:each) do
      post :create, course: course_attributes
    end

    context "with valid params" do
      let(:course_attributes) { attributes_for(:course) }
      it "assigns created course as @course" do
        expect(assigns(:course)).to be_a(Course)
      end

      it "redirect to show course" do
        expect(response).to redirect_to action: :show, id: assigns(:course).id
      end
    end

    context "with invalid params" do
      let(:course_attributes) { attributes_for(:invalid_course) }

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

    it "assigns the requested course as @course" do
      expect(assigns(:course)).to be_a_new(Course)
    end
  end

  describe "GET #edit" do
    let(:course) { create(:course) }

    before(:each) do
      get :edit, id: course.id
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "renders the edit template" do
      expect(response).to render_template(:edit)
    end

    it "assigns the requested course as @course" do
      expect(assigns(:course)).to eq(course)
    end
  end

  describe "GET #update" do
    let(:course){create(:course)}
    before(:each) do
      patch :update, id: course.id, course: course_attributes
    end

    context "with valid params" do
      let(:course_attributes) { attributes_for(:course) }
      it "assigns update course as @course" do
        expect(assigns(:course)).to be_a(Course)
      end

      it "redirect to show course" do
        expect(response).to redirect_to action: :show, id: assigns(:course).id
      end
    end

    context "with invalid params" do
      let(:course_attributes){attributes_for(:invalid_course)}
      it "assigns update course as @course" do
        expect(assigns(:course)).to be_a(Course)
      end

      it "re-render to edit course" do
        expect(response).to render_template(:edit)
      end
    end

  end

  describe "GET #destroy" do
    let(:course) { create(:course) }

    before(:each) do
      delete :destroy, id: course.id
    end

    it "destroys the requested course" do
      expect(Course.exists?(course.id)).to be(false)
    end

    it "redirects to the courses list" do
      expect(response).to redirect_to(courses_path)
    end
  end

end
