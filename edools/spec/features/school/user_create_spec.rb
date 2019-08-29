require 'rails_helper'

feature 'user create school' do
  scenario 'successfully' do
    visit new_school_path

    within('form') do
      fill_in 'Name', with: 'School Name'
      fill_in 'Owner E-mail', with: 'school@name.com'
      fill_in 'Pitch', with: 'School Pitch'
      fill_in 'Subdomain', with: Faker::Internet.domain_word

      click_on 'Create'
    end

    expect(page).to have_css('h1', text: 'School Name')
    expect(page).to have_content('school@name.com')
  end

  scenario 'with errors' do
    visit new_school_path

    within('form') do
      fill_in 'Name', with: nil
      fill_in 'Owner E-mail', with: 'school@name.com'

      click_on 'Create'
    end

    expect(page).to have_content('Check if there are any wrong fields')
  end
end
