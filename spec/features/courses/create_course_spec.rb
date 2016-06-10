require 'rails_helper'
feature 'Create course' do
  scenario 'with valid data create course' do
    school = FactoryGirl.create(:school)

    visit root_path
    click_link 'Escolas'
    click_link 'Ver todas'

    within("#school_#{school.id}") do
      click_link 'Cursos'
    end

    click_link 'Cadastrar curso'

    course = FactoryGirl.attributes_for(:school)

    fill_in 'Title', with: course[:title]
    fill_in 'Description', with: course[:description]
    fill_in 'Content', with: course[:content]
    fill_in 'Duration', with: course[:duration]
    fill_in 'Price', with: course[:price]
    fill_in 'Total active students', with: course[:total_active_students]


    click_button 'Salvar'

    expect(page).to have_content(course[:title])
  end

  scenario 'with invalid do not data create course' do
    school = FactoryGirl.create(:school)

    visit root_path
    click_link 'Escolas'
    click_link 'Ver todas'

    within("#school_#{school.id}") do
      click_link 'Cursos'
    end

    click_link 'Cadastrar curso'

    click_button 'Salvar'

    expect(page).to have_content('Verifique as informações do formulário.')
  end
end