require 'rails_helper'
feature 'Delete school' do
  scenario 'Remove school from database' do
    school = FactoryGirl.create(:school)
    visit root_path
    click_link 'Escolas'
    click_link 'Ver todas'

    within "#school_#{school.id}" do
      click_link 'Deletar'
    end

    expect(page).to_not have_content(school.name)
  end
end