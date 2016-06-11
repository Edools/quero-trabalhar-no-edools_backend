require 'rails_helper'
feature 'Students report' do
  scenario 'See a list of enrolled students for all school courses' do
    school = FactoryGirl.create(:school)

    course_1 = FactoryGirl.create(:course, school: school)
    course_2 = FactoryGirl.create(:course)

    student_1 = FactoryGirl.create(:student)
    student_2 = FactoryGirl.create(:student)

    course_1.students << student_1
    course_2.students << student_2

    visit root_path
    click_link 'Escolas'
    click_link 'Ver todas'

    within "#school_#{school.id}" do
      click_link 'Relatório de alunos'
    end

    expect(page).to have_content(student_1.name)
    expect(page).to have_content(course_1.title)

    expect(page).to_not have_content(student_2.name)
    expect(page).to_not have_content(course_2.title)
  end
end