require 'rails_helper'

feature 'School features' do

  let(:school) { build(:school) }

  scenario 'user list schools' do
    school = create(:school) 
    visit schools_path

    expect(page).to have_content(school.name)
  end

  scenario 'user see a school' do
    school = create(:school) 
    visit school_path(school)

    expect(page).to have_content(school.name)
  end

  scenario 'user create a new valid school' do
    visit new_school_path(school)

    fill_in 'Name', with: school.name
    fill_in 'Owner email', with: school.owner_email
    fill_in 'Pitch', with: school.pitch 
    fill_in 'Subdomain', with: school.subdomain
    fill_in 'Date of creation', with: school.date_of_creation.strftime("%d/%m/%Y")
    
    click_button 'Create School'

    expect(page).to have_content('Escola criada com sucesso.')
    expect(page).to have_content(school.name)
  end


  scenario 'user try to create a school with invalid inputs and get an error message' do
    visit new_school_path(school)

    fill_in 'Pitch', with: school.pitch 
    fill_in 'Subdomain', with: school.subdomain
    fill_in 'Date of creation', with: school.date_of_creation.strftime("%d/%m/%Y")
    
    click_button 'Create School'

    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Owner email can't be blank")
  end

  scenario 'user delete a school' do
    school = create(:school) 
    visit school_path(school)
    click_on 'Delete'

    expect(page).to have_content('Escola excluida com sucesso.')
  end

end
