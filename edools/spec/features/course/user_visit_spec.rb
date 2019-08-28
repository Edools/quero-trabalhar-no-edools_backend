require 'rails_helper'

feature 'user visit courses' do
  scenario 'successfully' do
    visit courses_path

    expect(page).to have_css('h1', text: 'Courses')
  end
end
