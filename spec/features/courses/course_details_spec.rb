require 'rails_helper'
feature 'See course details' do
  scenario 'List information about course' do
    school = FactoryGirl.create(:school)
    course = FactoryGirl.create(:course, school: school)

    visit root_path
    click_link 'Escolas'
    click_link 'Ver todas'

    within("#school_#{school.id}") do
      click_link 'Cursos'
    end

    within("#course_#{course.id}") do
      click_link 'Ver'
    end

    expect(page).to have_content(course.title)
    expect(page).to have_content(course.description)
    expect(page).to have_content(course.content)
    expect(page).to have_content(course.duration)
    # expect(page).to have_content(course.price)
    expect(page).to have_content(course.total_active_students)
  end
end