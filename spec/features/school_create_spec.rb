require 'rails_helper'

feature "Create a School" do
  scenario "Creating a valid school" do
    visit '/'
    click_on 'Nova Escola'

    fill_in '#school_name', with: 'My School'
    fill_in '#school_pitch', with: 'My Pitch'
    fill_in '#school_subdomain', with: 'my_subdomain'

    click_button 'Salvar'
  end
end
