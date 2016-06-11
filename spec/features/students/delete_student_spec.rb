require 'rails_helper'
feature 'Delete student' do
  scenario 'Remove student from database' do
    student = FactoryGirl.create(:student)
    visit root_path
    click_link 'Alunos'
    click_link 'Ver todos'

    within "#student_#{student.id}" do
      click_link 'Deletar'
    end

    expect(page).to_not have_content(student.name)
  end
end