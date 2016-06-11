require 'rails_helper'

RSpec.describe SchoolsController, type: :controller do
  describe "GET index" do
    let(:my_schools_group) { create_list(:school, 1) }

    before(:each) do
      get :index
    end

    it "assigns all schools as @schools" do
      expect(assigns(:schools)).to eq(my_schools_group)
    end
  end
end
