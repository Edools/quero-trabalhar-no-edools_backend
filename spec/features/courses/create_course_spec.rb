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

    fill_in 'Título', with: course[:title]
    fill_in 'Descrição', with: course[:description]
    fill_in 'Conteúdo', with: course[:content]
    fill_in 'Duração', with: course[:duration]
    fill_in 'Valor', with: course[:price]


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