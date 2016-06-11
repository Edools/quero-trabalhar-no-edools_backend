# encoding: utf-8
require 'rails_helper'
require 'capybara/rspec'

Capybara.javascript_driver = :selenium

describe "when access courses pages", js: true do
  it "create a new course" do
    new_school
    visit '/'
    click_on 'New School'
    click_on 'Novo Curso'
    fill_in 'Título', with: 'Ruby on Rails'
    fill_in 'Descrição', with: 'Curso completo de Ruby on Rails'
    fill_in 'Conteúdo', with: 'Todo o conteúdo'
    fill_in 'Duração', with: '1 ano'
    fill_in 'Preço', with: '3500.78'
    click_on 'Create Course'

    expect(page).to have_content('Curso cadastrado com sucesso.')
  end

  it "edit a course" do
    new_school
    new_course
    visit '/'
    click_on 'New School'
    within('tr', text: 'Ruby on Rails') do
      click_on 'Editar'
    end
    fill_in 'Título', with: 'Ruby on Rails Basic'
    fill_in 'Descrição', with: 'Curso Basico de RoR'
    click_on 'Update Course'

    expect(page).to have_content('Curso atualizado com sucesso.')
  end

  it "view description course" do
    new_school
    new_course
    visit '/'
    click_on 'New School'
    click_on "Descrição"

    expect(page).to have_content('Curso completo de Ruby on Rails')
  end

  xit "delete a course" do
    new_school
    new_course
    visit '/'
    click_on 'New School'
    within('tr', text: 'Ruby on Rails') do
      click_on 'Deletar'
    end

    expect(page).to have_content('Curso removido com sucesso.')
  end

  def new_school
    visit '/'
    click_on 'Nova Escola'
    fill_in 'Nome', with: 'New School'
    fill_in 'Email', with: 'foobar@gmail.com'
    fill_in 'Pitch', with: 'FooBarFooBarFooBar'
    fill_in 'Subdominio', with: 'foobar.edools.com'
    click_on 'Create School'
  end

  def new_course
    new_school
    visit '/'
    click_on 'New School'
    click_on 'Novo Curso'
    fill_in 'Título', with: 'Ruby on Rails'
    fill_in 'Descrição', with: 'Curso completo de Ruby on Rails'
    fill_in 'Conteúdo', with: 'Todo o conteúdo'
    fill_in 'Duração', with: '1 ano'
    fill_in 'Preço', with: '3500.78'
    click_on 'Create Course'
  end
end
