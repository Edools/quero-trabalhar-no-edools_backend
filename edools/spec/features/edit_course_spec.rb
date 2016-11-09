require 'rails_helper'

describe 'Course Edit' do
  it 'successful Edit' do
    school = FactoryGirl.create(:school)
    course = FactoryGirl.create(:course, school_id: school.id)
    new_title = "New Title"
    edit_course(school, course, new_title)
    upd_course = Course.find(course.id)
    expect(page).to have_content(upd_course.title)
  end

  def edit_course(school, course, new_title)
    visit "/schools/#{school.id}/courses/#{course.id}/edit"
    
    within("#edit_course_#{course.id}") do
      fill_in 'course_title', :with => new_title
    end
    click_button 'submit'
  end
end