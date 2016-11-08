require 'rails_helper'

RSpec.describe "courses/index", type: :view do
  before(:each) do
    assign(:courses, [
      Course.create!(
        :title => "Title",
        :description => "MyText",
        :content => "MyText",
        :duration => "Duration",
        :active_students => "9.99",
        :price => 2.5
      ),
      Course.create!(
        :title => "Title",
        :description => "MyText",
        :content => "MyText",
        :duration => "Duration",
        :active_students => "9.99",
        :price => 2.5
      )
    ])
  end

  it "renders a list of courses" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Duration".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
  end
end
