require 'rails_helper'
feature 'List Students' do
  scenario 'See a list of existent students' do
    students = FactoryGirl.create_list(:student, 3)
    visit root_path
    click_link 'Alunos'
    click_link 'Ver todos'


    students.each do |student|
      expect(page).to have_text(student.name)
    end
  end

  scenario 'See a message when there is no students already added' do
    visit root_path
    click_link 'Alunos'
    click_link 'Ver todos'

    expect(page).to have_text 'Ainda não existem alunos cadastradas'
  end
end