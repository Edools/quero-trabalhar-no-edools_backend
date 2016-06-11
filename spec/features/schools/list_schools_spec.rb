require 'rails_helper'
feature 'List Schools' do
  scenario 'See a list of existent schools' do
    schools = FactoryGirl.create_list(:school, 3)
    visit root_path
    click_link 'Escolas'
    click_link 'Ver todas'


    schools.each do |school|
      expect(page).to have_text(school.name)
    end
  end

  scenario 'See a message when there is no schools already added' do
    visit root_path
    click_link 'Escolas'
    click_link 'Ver todas'

    expect(page).to have_text 'Ainda não existem escolas cadastradas'
  end
end