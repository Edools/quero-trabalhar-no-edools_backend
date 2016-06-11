require 'rails_helper'
feature 'Search on sidebar form' do
  scenario 'search for student' do
    FactoryGirl.create(:student, name: 'My student for test')
    visit root_path
    fill_in 'q', with: 'student'
    click_button 'do-search'

    expect(page).to have_content 'My student for test'
  end

  scenario 'search for school' do
    FactoryGirl.create(:school, name: 'My school for test')
    visit root_path
    fill_in 'q', with: 'school'
    click_button 'do-search'

    expect(page).to have_content 'My school for test'
  end

  scenario 'search for course' do
    FactoryGirl.create(:course, title: 'My course for test')
    visit root_path
    fill_in 'q', with: 'course'
    click_button 'do-search'

    expect(page).to have_content 'My course for test'
  end
end