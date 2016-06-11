require 'rails_helper'
feature 'See student details' do
  scenario 'List information about student' do
    student = FactoryGirl.create(:student)
    visit root_path
    click_link 'Alunos'
    click_link 'Ver todos'

    within "#student_#{student.id}" do
      click_link 'Ver'
    end

    expect(page).to have_content(student.name)
    expect(page).to have_content(student.email)
    expect(page).to have_content(student.birthday)
  end
end