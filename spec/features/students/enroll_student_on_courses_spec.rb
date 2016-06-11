require 'rails_helper'
feature 'Enroll student on courses' do
  scenario 'select course and enroll student' do
    student = FactoryGirl.create(:student)
    course = FactoryGirl.create(:course, title: 'Course to test')

    visit root_path
    click_link 'Alunos'
    click_link 'Ver todos'
    within "#student_#{student.id}" do
      click_link 'Ver'
    end

    within "#course_#{course.id}" do
      click_link 'Matricular'
    end

    expect(student.courses(true)).to include(course)
  end

  scenario 'remove student from course' do
    student = FactoryGirl.create(:student)
    course = FactoryGirl.create(:course, title: 'Course to test')

    student.courses << course

    visit root_path
    click_link 'Alunos'
    click_link 'Ver todos'
    within "#student_#{student.id}" do
      click_link 'Ver'
    end

    within "#course_#{course.id}" do
      click_link 'Cancelar matrícula'
    end

    expect(student.courses(true)).to_not include(course)
  end
end