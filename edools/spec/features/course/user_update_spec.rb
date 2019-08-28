require 'rails_helper'

feature 'user update course' do
  scenario 'successfully' do
    course = create(:course)

    visit course_path(course)

    click_on 'Edit'

    within('form') do
      fill_in 'Title', with: 'Foo Title'
      click_on 'Edit'
    end

    expect(page).to have_css('h1', text: 'Foo Title')
  end

  scenario 'with-errors' do
    course = create(:course)

    visit course_path(course)

    click_on 'Edit'

    within('form') do
      fill_in 'Title', with: nil
      click_on 'Edit'
    end

    expect(page).to have_content('Check if there are any wrong fields')
  end
end
