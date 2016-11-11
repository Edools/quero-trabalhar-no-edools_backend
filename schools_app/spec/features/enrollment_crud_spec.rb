feature 'As an User I manage Enrollment CRUD' do
  scenario 'creating and destroying' do
    enrollment = FactoryGirl.build(:enrollment)

    visit enrollments_path
    expect(page).to have_no_content enrollment.student.name.truncate(20)

    # Create
    click_link 'Nova Matrícula'
    select enrollment.student.name, from: 'enrollment_student_id'
    select enrollment.course.title, from: 'enrollment_course_id'
    submit_form
    expect(current_path).to eq(enrollments_path)
    expect(page).to have_content enrollment.student.name.truncate(20)

    # Destroy
    expect { click_link 'Excluir' }.to change(Enrollment, :count).by(-1)
  end
end
