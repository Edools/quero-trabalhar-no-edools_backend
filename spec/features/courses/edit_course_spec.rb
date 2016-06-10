require 'rails_helper'
feature 'Create course' do
  scenario 'with valid data create course' do
    school = FactoryGirl.create(:school)
    course = FactoryGirl.create(:course, school: school)

    visit root_path
    click_link 'Escolas'
    click_link 'Ver todas'

    within("#school_#{school.id}") do
      click_link 'Cursos'
    end

    within("#course_#{course.id}") do
      click_link 'Editar'
    end

    fill_in 'Title', with: 'New title for course'

    click_button 'Salvar'

    expect(page).to have_content('New title for course')
  end

  scenario 'with invalid do not data create school' do
    school = FactoryGirl.create(:school)
    course = FactoryGirl.create(:course, school: school)

    visit root_path
    click_link 'Escolas'
    click_link 'Ver todas'

    within("#school_#{school.id}") do
      click_link 'Cursos'
    end

    within("#course_#{course.id}") do
      click_link 'Editar'
    end

    fill_in 'Title', with: ''

    click_button 'Salvar'

    expect(page).to have_content('Verifique as informações do formulário.')
  end
end