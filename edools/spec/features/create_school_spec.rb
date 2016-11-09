require 'rails_helper'

describe "Create school", :type => :feature do

  it "create success" do
    school = FactoryGirl.attributes_for(:school)
    create_school(school)
    expect(page).to have_content(school[:name])
  end

  it 'validates invalid email' do
    school = FactoryGirl.attributes_for(:school)
    school[:owner_email] = "email"
    create_school(school)
    expect(page).to have_xpath("//div/form/div[@class='alert alert-danger']")
  end

  it 'validates duplicated email' do
    school = FactoryGirl.attributes_for(:school)
    old_email = school[:owner_email]
    create_school(school)

    school = FactoryGirl.attributes_for(:school)
    school[:owner_email] = old_email
    create_school(school)
    expect(page).to have_xpath("//div/form/div[@class='alert alert-danger']")
  end

  it 'validates invalid subdomain' do
    school = FactoryGirl.attributes_for(:school)
    school[:subdomain] = "-domain"
    create_school(school)
    expect(page).to have_xpath("//div/form/div[@class='alert alert-danger']")
  end

  it 'validates duplicated subdomain' do
    school = FactoryGirl.attributes_for(:school)
    old_subdomain = school[:subdomain]
    create_school(school)
    school = FactoryGirl.attributes_for(:school)
    school[:subdomain] = old_subdomain
    create_school(school)

    expect(page).to have_xpath("//div/form/div[@class='alert alert-danger']")
  end
  
  def create_school(school)
    visit "/schools/new"
    within("#new_school") do
      fill_in "school_name", :with => school[:name]
      fill_in "school_owner_email", :with => school[:owner_email]
      fill_in "school_pitch", :with => school[:pitch]
      fill_in "school_subdomain", :with => school[:subdomain]
    end
    click_button "submit"
  end
end