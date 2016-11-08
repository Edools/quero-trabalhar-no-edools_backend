require 'rails_helper'

RSpec.describe "schools/index", type: :view do
  before(:each) do
    assign(:schools, [
      School.create!(
        :name => "Name",
        :owner_email => "Owner Email",
        :pitch => "MyText",
        :subdomain => "Subdomain"
      ),
      School.create!(
        :name => "Name",
        :owner_email => "Owner Email",
        :pitch => "MyText",
        :subdomain => "Subdomain"
      )
    ])
  end

  it "renders a list of schools" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Owner Email".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Subdomain".to_s, :count => 2
  end
end
