# encoding: utf-8
require 'rails_helper'
require 'capybara/rspec'

Capybara.javascript_driver = :selenium

describe "when access schools page" do
  it "create a new school", :js => true do
    visit '/'
    click_on 'Nova Escola'
    fill_in 'Nome', with: 'FooBar'
    fill_in 'Email', with: 'foobar@gmail.com'
    fill_in 'Pitch', with: 'FooBarFooBar FooBar'
    fill_in 'Subdominio', with: 'foo-bar.edools.com'
    click_on 'Create School'

    expect(page).to have_content('Escola cadastrada com sucesso.')
  end

  it "edit a school", js: true  do
    visit '/'
    click_on 'FooBar'
    click_on 'Editar'
    fill_in 'Nome', with: 'Escola Teste'
    fill_in 'Email', with: 'foo-bar@gmail.com'
    click_on 'Update School'

    expect(page).to have_content('Escola atualizada com sucesso.')
  end

  it "destroy a school" do
    new_school
    visit '/'
    click_on 'New School'
    click_link 'Deletar'
    using_wait_time(10)
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
