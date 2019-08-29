require 'rails_helper'

feature 'user create course' do
  scenario 'successfully' do
    visit new_course_path

    School.find_or_create_by(name: 'XPTO School')

    within('form') do
      fill_in 'Title', with: 'Course Title'
      fill_in 'Description', with: 'Course Description'
      fill_in 'Content', with: 'Course Content'
      fill_in 'Duration', with: '20'
      fill_in 'Active Students', with: '12'
      fill_in 'Price', with: '59,90'
      find('select').find("option[value='#{School.first.id}']").select_option

      click_on 'Create'
    end

    expect(page).to have_css('h1', text: 'Course Title')
    expect(page).to have_content('Course Description')
  end

  scenario 'with errors' do
    visit new_course_path

    School.find_or_create_by(name: 'XPTO School')

    within('form') do
      fill_in 'Title', with: nil
      fill_in 'Description', with: 'Course Description'
      find('select').find("option[value='#{School.first.id}']").select_option

      click_on 'Create'
    end

    expect(page).to have_content('Check if there are any wrong fields')
  end
end
