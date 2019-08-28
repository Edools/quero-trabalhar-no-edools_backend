require 'rails_helper'

feature 'user destroy course' do
  scenario 'successfully' do
    course = create(:course)

    visit course_path(course)

    expect { click_on 'Delete' }.to change(Course, :count).by(-1)
  end
end
