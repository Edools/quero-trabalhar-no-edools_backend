require 'rails_helper'

feature "Acessando página inicial" do
  it "consigo acessar o link principal da página" do
      visit root_path
  end
end
