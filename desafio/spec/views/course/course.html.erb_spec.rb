require 'rails_helper'

feature 'Criando Curso' do
  scenario "posso criar um curso" do
    visit '/'

    click_link 'Criar Curso'

    fill_in 'Título do curso', with: 'Introdução a programação com Rails'
    fill_in 'Escola', with: 1 #ID da escola
    fill_in 'Descrição', with: 'Lorem ipsum dolor sit amet, quo eu soluta detracto, vim eu tation deleniti fabellas, falli prompta '
    fill_in 'Duração', with: 50
    fill_in 'Data de Criação', with: Time.now
    fill_in 'Alunos Ativos', with: rand(100)
    fill_in 'Preço', with: rand(0.0..100.0)


    click_button 'Criar Curso'

    expect(page).to have_content('Curso criado com sucesso.')
  end
end
