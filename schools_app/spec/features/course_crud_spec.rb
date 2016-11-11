feature 'As an User I manage Course CRUD' do
  scenario 'creating and destroying' do
    course = FactoryGirl.build(:course)

    visit courses_path
    expect(page).to have_no_content course.title

    # Submit invalid
    click_link 'Novo Curso'
    fill_in 'course_title', with: course.title
    submit_form
    expect(page).to have_content 'Conteúdo não pode ficar em branco'

    # Create
    fill_in 'course_title', with: course.title
    fill_in 'course_price', with: course.price
    fill_in 'course_duration', with: course.duration
    fill_in 'course_description', with: course.description
    fill_in 'course_content', with: course.content
    submit_form
    expect(current_path).to eq(courses_path)
    expect(page).to have_content course.title.truncate(20)

    # Destroy
    expect { click_link 'Excluir' }.to change(Course, :count).by(-1)
  end

  scenario 'updating' do
    course = FactoryGirl.create(:course)

    # Update
    visit edit_course_path(course)
    fill_in 'course_title', with: 'Novo título de Curso'
    submit_form
    expect(current_path).to eq(courses_path)
    expect(page).to have_content 'Novo título de Curso'
  end

  scenario 'searching by title' do
    course_mechanics = FactoryGirl.create(:course, title: 'Mechanics')
    course_physics = FactoryGirl.create(:course, title: 'Physics')

    visit courses_path
    expect(page).to have_content course_mechanics.title
    fill_in 'q', with: course_physics.title
    submit_form_by_button
    expect(page).to have_content course_physics.title
    expect(page).to have_no_content course_mechanics.title
  end

  scenario 'searching by title and filtering by school' do
    school = FactoryGirl.create(:school)

    course_stanford = FactoryGirl.create(:course,
                                         title: 'Mechanics',
                                         school: school,
                                         duration: '2 semanas')
    course_mit = FactoryGirl.create(:course,
                                    title: 'Mechanics',
                                    duration: '1 semana')

    visit courses_path
    expect(page).to have_content course_mit.title
    fill_in 'q', with: course_stanford.title
    find('#course_school_id').find(:xpath, "option[@value='#{school.id}']").select_option
    submit_form_by_button
    expect(page).to have_content course_stanford.duration
    expect(page).to have_no_content course_mit.duration
  end
end
