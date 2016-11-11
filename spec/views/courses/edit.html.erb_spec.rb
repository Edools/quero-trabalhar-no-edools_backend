require 'rails_helper'

RSpec.describe 'courses/edit', type: :view do
  before(:each) do
    @course = assign(:course, create(:course))
  end

  it 'renders the edit course form' do
    render

    assert_select 'form[action=?][method=?]', course_path(@course), 'post' do

      assert_select 'input#course_title[name=?]', 'course[title]'

      assert_select 'textarea#course_description[name=?]', 'course[description]'

      assert_select 'textarea#course_content[name=?]', 'course[content]'

      assert_select 'input#course_duration[name=?]', 'course[duration]'

      assert_select 'input#course_active_students[name=?]', 'course[active_students]'

      assert_select 'input#course_price[name=?]', 'course[price]'
    end
  end
end
