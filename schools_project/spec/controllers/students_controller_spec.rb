require 'rails_helper'

RSpec.describe StudentsController, type: :controller do

  login_user

  let(:user) { User.first }

  let(:valid_attributes) {
    { name: 'MyString', course_id: FactoryBot.create(:course, user: user) }
  }

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Student" do
        expect {
          post :create, params: {student: valid_attributes}
        }.to change(Student, :count).by(1)
      end

      it "redirects to the created course" do
        post :create, params: {student: valid_attributes}
        expect(response).to redirect_to(courses_path)
      end
    end
  end
end
