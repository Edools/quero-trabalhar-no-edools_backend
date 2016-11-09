require 'rails_helper'

describe 'Student Edit' do
  it 'successful Edit' do
    student = FactoryGirl.create(:student)
    new_name = "New Name"
    edit_student(student, new_name)
    upd_student = Student.find(student.id)
    expect(page).to have_content(upd_student.name)
  end

  def edit_student(student, new_name)
    visit "/students/#{student.id}/edit"
    
    within("#edit_student_#{student.id}") do
      fill_in 'student_name', :with => new_name
    end
    click_button 'submit'
  end
end