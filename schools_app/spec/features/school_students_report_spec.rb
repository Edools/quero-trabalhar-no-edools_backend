feature 'As an User I use School reports' do
  scenario 'generating active students report' do
    enrollment_one = FactoryGirl.create(:enrollment)
    enrollment_two = FactoryGirl.create(:enrollment, course: enrollment_one.course)
    course = FactoryGirl.create(:course, school: enrollment_one.course.school)

    visit report_school_path(enrollment_one.course.school)
    expect(page).to have_content enrollment_one.course.title
    expect(page).to have_content enrollment_one.student.name
    expect(page).to have_content enrollment_two.student.name
    expect(page).to have_content course.title
    expect(page).to have_content 'O curso não possui nenhum aluno ativo!'
  end
end
