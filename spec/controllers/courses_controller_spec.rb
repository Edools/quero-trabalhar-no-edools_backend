require 'rails_helper'

RSpec.describe CoursesController, type: :controller do

  let(:valid_attributes) { build(:valid_course).attributes }

  let(:invalid_attributes) { build(:invalid_course).attributes }

  let!(:course) { create(:valid_course) }

  describe "GET #index" do
    it "assigns all courses as @courses" do
      get :index, school_id: course.school.to_param
      expect(assigns(:courses)).to eq([course])
    end
  end

  describe "GET #new" do
    it "assigns a new course as @course" do
      get :new, school_id: course.school.to_param
      expect(assigns(:course)).to be_a_new(Course)
    end
  end

  describe "GET #edit" do
    it "assigns the requested course as @course" do
      get :edit, {:id => course.to_param, school_id: course.school.to_param}
      expect(assigns(:course)).to eq(course)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Course" do
        expect {
          post :create, {:course => valid_attributes, school_id: course.school}
        }.to change(Course, :count).by(1)
      end

      it "assigns a newly created course as @course" do
        post :create, {:course => valid_attributes, school_id: course.school}
        expect(assigns(:course)).to be_a(Course)
        expect(assigns(:course)).to be_persisted
      end

      it "redirects to the created course" do
        post :create, {:course => valid_attributes, school_id: course.school}
        expect(response).to redirect_to(school_courses_path(school_id: course.school.to_param))
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved course as @course" do
        post :create, {:course => invalid_attributes, school_id: course.school}
        expect(assigns(:course)).to be_a_new(Course)
      end

      it "re-renders the 'new' template" do
        post :create, {:course => invalid_attributes, school_id: course.school}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { title: 'New Title'}
      }

      it "updates the requested course" do
        put :update, {:id => course.to_param, :course => new_attributes, school_id: course.school}
        course.reload
        expect(course.title).to eql(new_attributes[:title])
      end

      it "assigns the requested course as @course" do
        put :update, {:id => course.to_param, :course => valid_attributes, school_id: course.school}
        expect(assigns(:course)).to eq(course)
      end

      it "redirects to the course" do
        put :update, {:id => course.to_param, :course => valid_attributes, school_id: course.school}
        expect(response).to redirect_to(school_courses_url(school_id: course.school.to_param))
      end
    end

    context "with invalid params" do
      it "assigns the course as @course" do
        put :update, {:id => course.to_param, :course => invalid_attributes, school_id: course.school}
        expect(assigns(:course)).to eq(course)
      end

      it "re-renders the 'edit' template" do
        put :update, {:id => course.to_param, :course => invalid_attributes, school_id: course.school}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested course" do
      expect {
        delete :destroy, {:id => course.to_param, school_id: course.school.to_param}
      }.to change(Course, :count).by(-1)
    end

    it "redirects to the courses list" do
      delete :destroy, {:id => course.to_param, school_id: course.school.to_param}
      expect(response).to redirect_to(school_courses_url(school_id: course.school.to_param))
    end
  end

end
