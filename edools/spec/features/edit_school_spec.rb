require 'rails_helper'

describe 'School Edit' do
  it 'successful Edit' do
    school = FactoryGirl.create(:school)
    new_name = "New Name"
    edit_school(school, new_name)
    upd_school = School.find(school.id)
    expect(page).to have_content(upd_school.name)
  end

  def edit_school(school, new_name)
    visit "/schools/#{school.id}/edit"
    
    within("#edit_school_#{school.id}") do
      fill_in 'school_name', :with => new_name
    end
    click_button 'submit'
  end
end