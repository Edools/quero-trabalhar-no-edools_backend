require 'rails_helper'

RSpec.describe "courses/new", type: :view do
  before(:each) do
    assign(:course, Course.new(
      :title => "MyString",
      :description => "MyText",
      :content => "MyText",
      :duration => "MyString",
      :active_students => "9.99",
      :price => 1.5
    ))
  end

  it "renders new course form" do
    render

    assert_select "form[action=?][method=?]", courses_path, "post" do

      assert_select "input#course_title[name=?]", "course[title]"

      assert_select "textarea#course_description[name=?]", "course[description]"

      assert_select "textarea#course_content[name=?]", "course[content]"

      assert_select "input#course_duration[name=?]", "course[duration]"

      assert_select "input#course_active_students[name=?]", "course[active_students]"

      assert_select "input#course_price[name=?]", "course[price]"
    end
  end
end
