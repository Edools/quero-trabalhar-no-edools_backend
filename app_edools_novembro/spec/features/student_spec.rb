# encoding: utf-8
require 'rails_helper'
require 'capybara/rspec'

Capybara.javascript_driver = :selenium

describe "when access students pages", js: true do
  it "create a new student" do
    new_school
    visit '/'
    click_on 'New School'
    click_on "Novo Aluno"
    fill_in 'Nome', with: "Antonio Carlos"
    fill_in 'Endereço', with: "Rua São Vicente, 110"
    fill_in 'Telefone', with: "999966666"
    fill_in 'CPF', with: "123.456.789-00"
    select('Ativo', from: 'Status')
    click_on 'Create Student'

    expect(page).to have_content('Aluno cadastrado com sucesso.')
  end

  it "list a student" do
    new_school
    new_student
    visit '/'
    click_on 'New School'
    click_on 'Listar Alunos'

    expect(page).to have_content("Antonio Carlos")
  end

  xit "delete a student" do
    new_school
    new_student
    visit '/'
    click_on 'New School'
    click_on 'Listar Alunos'
    click_on 'Deletar'

    expect(page).to have_content('Aluno removido com sucesso.')
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

  def new_student
    visit '/'
    click_on 'New School'
    click_on "Novo Aluno"
    fill_in 'Nome', with: "Antonio Carlos"
    fill_in 'Endereço', with: "Rua São Vicente, 110"
    fill_in 'Telefone', with: "999966666"
    fill_in 'CPF', with: "123.456.789-00"
    select('Ativo', from: 'Status')
    click_on 'Create Student'
  end
end
