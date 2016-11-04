require 'rails_helper'

Rspec.describe School, type: :model do
	describe "# create new school" do
		it "Shouldn't create" do
			school = FactoryGirl.create(:school)
			expect(school.erros.count).to be > 0
		end
	end
end


