require 'rails_helper'
feature 'Create school' do
  scenario 'with valid data create school' do
    visit root_path
    click_link 'Escolas'
    click_link 'Cadastrar nova escola'

    school = FactoryGirl.attributes_for(:school)

    fill_in 'Nome', with: school[:name]
    fill_in 'Email de contato', with: school[:contact_email]
    fill_in 'Pitch', with: school[:pitch]
    fill_in 'Subdomínio', with: school[:subdomain]

    click_button 'Salvar'

    expect(page).to have_content(school[:name])
  end

  scenario 'with invalid do not data create school' do
    visit root_path
    click_link 'Escolas'
    click_link 'Cadastrar nova escola'

    click_button 'Salvar'

    expect(page).to have_content('Verifique as informações do formulário.')
  end
end