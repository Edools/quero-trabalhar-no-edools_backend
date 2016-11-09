require 'rails_helper'

describe 'Create Enroll' do
  it 'successful create' do
    school = FactoryGirl.create(:school)
    course = FactoryGirl.create(:course, school: school)
    student = FactoryGirl.create(:student)
    create_enroll(student, course)
    expect(page).to have_content(course[:title])
  end

  it 'fails on duplicated enroll' do
    school = FactoryGirl.create(:school)
    course = FactoryGirl.create(:course, school: school)
    student = FactoryGirl.create(:student)
    create_enroll(student, course)
    expect(page).to have_content(course[:title]) # this should be ok
    create_enroll(student, course)   

    expect(page).to have_xpath("//div/form/div[@class='alert alert-danger']") # this shouldn't
  end

  def create_enroll(student, course)
    visit "/students/#{student.id}/enrolls/new"
    within('#new_enroll') do
      choose ("enroll_course_id_#{course.id}")
    end
    click_button 'submit'
  end
end