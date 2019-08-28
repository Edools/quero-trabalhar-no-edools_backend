require 'rails_helper'

feature 'user update school' do
  scenario 'successfully' do
    school = create(:school)

    visit school_path(school)

    click_on 'Edit'

    within('form') do
      fill_in 'Name', with: 'Foo Name'
      click_on 'Edit'
    end

    expect(page).to have_css('h1', text: 'Foo Name')
  end

  scenario 'with-errors' do
    school = create(:school)

    visit school_path(school)

    click_on 'Edit'

    within('form') do
      fill_in 'Name', with: nil
      click_on 'Edit'
    end

    expect(page).to have_content('Check if there are any wrong fields')
  end
end
