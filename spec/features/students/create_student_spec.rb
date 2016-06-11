require 'rails_helper'
feature 'Create student' do
  scenario 'with valid data create student' do
    visit root_path
    click_link 'Alunos'
    click_link 'Cadastrar novo aluno'

    student = FactoryGirl.attributes_for(:student)

    fill_in 'Name', with: student[:name]
    fill_in 'Email', with: student[:email]
    fill_in 'Birthday', with: student[:birthday]

    click_button 'Salvar'

    expect(page).to have_content(student[:name])
  end

  scenario 'with invalid do not data create student' do
    visit root_path
    click_link 'Alunos'
    click_link 'Cadastrar novo aluno'

    click_button 'Salvar'

    expect(page).to have_content('Verifique as informações do formulário.')
  end
end