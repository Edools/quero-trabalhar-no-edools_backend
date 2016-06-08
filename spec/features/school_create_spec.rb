require 'rails_helper'

feature "Create a School" do
  scenario "Creating a valid school" do
    visit '/'

    click_button 'Escolas'
    click_button 'Nova Escola'

    fill_in 'Name', with: 'My School'
    fill_in 'Pitch', with: 'My Pitch'
    fill_in 'Subomain', with: 'my_school'

    click_button 'Salvar'
  end
end
