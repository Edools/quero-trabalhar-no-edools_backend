require 'rails_helper'

feature 'user visit schools' do
  scenario 'successfully' do
    visit schools_path

    expect(page).to have_css('h1', text: 'Schools')
  end
end
