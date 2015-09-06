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
end
