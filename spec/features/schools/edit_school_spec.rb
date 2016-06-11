require 'rails_helper'
feature 'Edit school' do
  scenario 'with valid data change school attributes' do
    school = FactoryGirl.create(:school)
    visit root_path
    click_link 'Escolas'
    click_link 'Ver todas'

    within "#school_#{school.id}" do
      click_link 'Editar'
    end

    fill_in 'Nome', with: 'New name for school'

    click_button 'Salvar'

    expect(page).to have_content('New name for school')
  end

  scenario 'with invalid do not data change school attributes' do
    school = FactoryGirl.create(:school)
    visit root_path
    click_link 'Escolas'
    click_link 'Ver todas'

    within "#school_#{school.id}" do
      click_link 'Editar'
    end

    fill_in 'Nome', with: ''

    click_button 'Salvar'

    expect(page).to have_content('Verifique as informações do formulário.')
  end
end