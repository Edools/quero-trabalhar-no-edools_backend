require 'rails_helper'
feature 'List courses' do
  scenario 'See a list of existent courses' do
    school = FactoryGirl.create(:school)
    courses = FactoryGirl.create_list(:course, 3, school: school)

    visit root_path
    click_link 'Escolas'
    click_link 'Ver todas'

    within("#school_#{school.id}") do
      click_link 'Cursos'
    end

    courses.each do |course|
      expect(page).to have_text(course.title)
    end
  end

  scenario 'See a message when there is no course already added' do
    school = FactoryGirl.create(:school)

    visit root_path
    click_link 'Escolas'
    click_link 'Ver todas'

    within("#school_#{school.id}") do
      click_link 'Cursos'
    end

    expect(page).to have_text 'Ainda não existem cursos cadastradas'
  end
end