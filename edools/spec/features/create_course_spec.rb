require 'rails_helper'

describe 'Course creation' do
  it 'successful create' do
    school = FactoryGirl.create(:school)
    course = FactoryGirl.attributes_for(:course)
    create_course(school.id, course)
    expect(page).to have_content(course[:title])
  end

  it 'fails on null title' do
    school = FactoryGirl.create(:school)
    course = FactoryGirl.attributes_for(:course)
    old_title = course[:title] 
    course[:title] = ''
    create_course(school.id, course)
    expect(page).to have_xpath("//div/form/div[@class='alert alert-danger']")
  end

  def create_course(school_id, course)
    visit "/schools/#{school_id}/courses/new"
    within('#new_course') do
      fill_in 'course_title', :with => course[:title]
      fill_in 'course_description', :with => course[:description]
      fill_in 'course_content', :with => course[:content]
      fill_in 'course_duration', :with => 100
      fill_in 'course_price', :with => 199.99
    end
    click_button 'submit'
  end
end