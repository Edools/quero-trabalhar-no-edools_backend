require 'rails_helper'

feature 'Criando Escola' do
  scenario "posso criar uma escola" do
    visit '/'

    click_link 'Cadastrar Escola'

    fill_in 'Nome da Escola', with: 'Escola Edool'
    fill_in 'Email do Dono', with: 'teste@edool.com.br'
    fill_in 'Apresentação', with: 'Lorem ipsum dolor sit amet, quo eu soluta detracto, vim eu tation deleniti fabellas, falli prompta '
    fill_in 'Subdomínio', with: 'escola-edool'
    fill_in 'Data de Criação', with: Time.now

    click_button 'Cadastrar Escola'

    expect(page).to have_content('Escola cadastrada com sucesso.')
  end
end
