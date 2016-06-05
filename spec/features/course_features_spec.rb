require 'rails_helper'

feature 'Course features' do

  let(:course) { build(:course) }

  scenario 'user list courses' do
    course = create(:course) 
    visit courses_path

    expect(page).to have_content(course.title)
  end

  scenario 'user see a course' do
    course = create(:course) 
    visit course_path(course)

    expect(page).to have_content(course.title)
  end

  scenario 'user create a new valid course' do
    visit new_course_path(course)

    fill_in 'Title', with: course.title
    fill_in 'Description', with: course.description
    fill_in 'Content', with: course.content 
    fill_in 'Duration', with: course.duration
    fill_in 'Creation date', with: course.creation_date.strftime("%d/%m/%Y")
    fill_in 'Active students', with: course.active_students
    fill_in 'Price', with: course.price

    click_button 'Create Course'

    expect(page).to have_content('Curso criado com sucesso.')
    expect(page).to have_content(course.title)
  end


  scenario 'user try to create a course with invalid inputs and get an error message' do
    visit new_course_path(course)

    fill_in 'Description', with: course.description
    fill_in 'Content', with: course.content 
    fill_in 'Duration', with: course.duration
    fill_in 'Active students', with: course.active_students
    fill_in 'Price', with: course.price

    click_button 'Create Course'


    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Creation date can't be blank")
  end

  scenario 'user delete a course' do
    course = create(:course) 
    visit course_path(course)
    click_on 'Delete'

    expect(page).to have_content('Curso excluido com sucesso.')
  end

  scenario 'user update a course' do
    course = create(:course) 
    visit edit_course_path(course)
    
    fill_in 'Title', with: Faker::StarWars.character
    click_on 'Update Course'

    expect(page).to have_content('Curso atualizado com sucesso.')
  end

end
