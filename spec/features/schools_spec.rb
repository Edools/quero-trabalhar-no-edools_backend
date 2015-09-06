require 'rails_helper'

describe "Schools" do
  context "List schools" do
    let(:schools) { create_list(:school, 2) }

    it "shows a page of schools" do
      visit schools_path

      expect(page).to have_content "Escolas"
    end

    it "shows a list of schools already created" do
      visit schools_path

      expect(page).to have_content schools.first.name
      expect(page).to have_content schools.last.name
    end
  end

  context "Create school" do
    it "goes to new school page" do
      visit new_school_path

      expect(page).to have_content "Nova Escola"
    end

    it "creates a new school" do
      visit new_school_path

      fill_in "school_name", with: "Fulano"
      fill_in "school_owner_email", with: "fulano@email.com"
      fill_in "school_subdomain", with: "escoladofulano.edools.com"

      click_on "Salvar"

      expect(page).to have_content "Salvo com sucesso"
    end
  end
end
