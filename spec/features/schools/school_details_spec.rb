require 'rails_helper'
feature 'See school details' do
  scenario 'List information about school' do
    school = FactoryGirl.create(:school)
    visit root_path
    click_link 'Escolas'
    click_link 'Ver todas'

    within "#school_#{school.id}" do
      click_link 'Ver'
    end

    expect(page).to have_content(school.name)
    expect(page).to have_content(school.contact_email)
    expect(page).to have_content(school.pitch)
    expect(page).to have_content(school.subdomain)
  end
end