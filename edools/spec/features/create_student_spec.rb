require 'rails_helper'

describe "Create student", :type => :feature do

  it "create success" do
    student = FactoryGirl.attributes_for(:student)
    create_student(student)
    expect(page).to have_content(student[:name])
  end

  it 'validates invalid email' do
    student = FactoryGirl.attributes_for(:student)
    student[:email] = "email"
    create_student(student)
    expect(page).to have_xpath("//div/form/div[@class='alert alert-danger']")
  end

  it 'validates duplicated email' do
    student = FactoryGirl.attributes_for(:student)
    old_email = student[:email]
    create_student(student)

    student = FactoryGirl.attributes_for(:student)
    student[:email] = old_email
    create_student(student)
    expect(page).to have_xpath("//div/form/div[@class='alert alert-danger']")
  end
  
  def create_student(student)
    visit "/students/new"
    within("#new_student") do
      fill_in "student_name", :with => student[:name]
      fill_in "student_email", :with => student[:email]
    end
    click_button "submit"
  end
end