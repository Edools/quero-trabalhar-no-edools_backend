require 'rails_helper'

RSpec.describe "courses/show", type: :view do
  before(:each) do
    @course = assign(:course, Course.create!(
      :title => "Title",
      :description => "MyText",
      :content => "MyText",
      :duration => "Duration",
      :active_students => 9,
      :price => 2.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Duration/)
    expect(rendered).to match(/9/)
    expect(rendered).to match(/2.5/)
  end
end
