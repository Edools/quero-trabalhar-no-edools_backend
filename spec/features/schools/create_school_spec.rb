require 'rails_helper'
feature 'Create school' do
  scenario 'with valid data create school' do
    visit root_path
    click_link 'Escolas'
    click_link 'Cadastrar nova escola'

    school = FactoryGirl.attributes_for(:school)

    fill_in 'Name', with: school[:name]
    fill_in 'Contact email', with: school[:contact_email]
    fill_in 'Pitch', with: school[:pitch]
    fill_in 'Subdomain', with: school[:subdomain]

    click_button 'Salvar'

    expect(page).to have_content(school[:name])
  end

  scenario 'with invalid do not data create school' do

  end
end