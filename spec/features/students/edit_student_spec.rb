require 'rails_helper'
feature 'Edit student' do
  scenario 'with valid data change student attributes' do
    student = FactoryGirl.create(:student)
    visit root_path
    click_link 'Alunos'
    click_link 'Ver todos'

    within "#student_#{student.id}" do
      click_link 'Editar'
    end

    fill_in 'Nome', with: 'New name for student'

    click_button 'Salvar'

    expect(page).to have_content('New name for student')
  end

  scenario 'with invalid do not data change student attributes' do
    student = FactoryGirl.create(:student)
    visit root_path
    click_link 'Alunos'
    click_link 'Ver todos'

    within "#student_#{student.id}" do
      click_link 'Editar'
    end

    fill_in 'Nome', with: ''

    click_button 'Salvar'

    expect(page).to have_content('Verifique as informações do formulário.')
  end
end