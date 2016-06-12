require 'rails_helper'

RSpec.describe "schools/new", type: :view do
  let(:attributes) do
    { name: 'School Name', owner_email: 'foo@bar.com',
      pitch: 'My Text', subdomain: 'subdomain'}
  end
  
  before(:each) { assign(:school, build(:valid_school, attributes)) }

  it "renders new school form" do
    render

    assert_select "form[action=?][method=?]", schools_path, "post" do

      assert_select "input#school_name[name=?]", "school[name]"

      assert_select "input#school_owner_email[name=?]", "school[owner_email]"

      assert_select "textarea#school_pitch[name=?]", "school[pitch]"

      assert_select "input#school_subdomain[name=?]", "school[subdomain]"
    end
  end
end
