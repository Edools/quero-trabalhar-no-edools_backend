# encoding: utf-8
require 'rails_helper'
require 'capybara/rspec'

Capybara.javascript_driver = :selenium

describe "when access schools page", js: true do
  it "create a new school" do
    visit '/'
    click_on 'Nova Escola'
    fill_in 'Nome', with: 'FooBar'
    fill_in 'Email', with: 'foobar@gmail.com'
    fill_in 'Pitch', with: 'FooBarFooBar FooBar'
    fill_in 'Subdominio', with: 'foo-bar.edools.com'
    click_on 'Create School'

    expect(page).to have_content('Escola cadastrada com sucesso.')
  end

  xit "try to duplicate a record in the database" do
    new_school
    visit '/'
    click_on 'Nova Escola'
    fill_in 'Nome', with: 'New School'
    fill_in 'Email', with: 'foobar@gmail.com'
    fill_in 'Pitch', with: 'FooBarFooBarFooBar'
    fill_in 'Subdominio', with: 'foobar.edools.com'
    click_on 'Create School'

    expect(page).to have_content("3 erros no preenchimento ")
    expect(page).to have_content("O nome já está sendo utilizado")
    expect(page).to have_content("O email já está sendo utilizado")
    expect(page).to have_content("Este subdominio já foi escolhido")
  end

  it "invalid subdomain" do
    visit '/'
    click_on 'Nova Escola'
    fill_in 'Nome', with: 'Another School'
    fill_in 'Email', with: 'foo-bar@gmail.com'
    fill_in 'Pitch', with: 'Foo-Bar-Foo-Bar-Foo-Bar'
    fill_in 'Subdominio', with: 'foo-bar.com.br'
    click_on 'Create School'

    expect(page).to have_content("1 erro no preenchimento")
    expect(page).to have_content("O campo subdominio está com um formato inválido")
  end

  it "edit a school"  do
    visit '/'
    click_on 'FooBar'
    click_on 'Editar'
    fill_in 'Nome', with: 'Escola Teste'
    fill_in 'Email', with: 'foo-bar@gmail.com'
    click_on 'Update School'

    expect(page).to have_content('Escola atualizada com sucesso.')
  end

  xit "destroy a school" do
    new_school
    visit '/'
    click_on 'New School'
    click_link 'Deletar'

    page.driver.browser.switch_to.alert.accept

    expect(page).to have_content('Escola removida com sucesso.')
  end

  it "test button back" do
    new_school
    visit '/'
    click_on 'New School'
    click_on 'Voltar'

    expect(page).to have_content('Controle de Escolas')
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
end
