feature 'Site layout', type: :feature do
   scenario 'Home links' do
    visit root_path

    # Visit schools index
    expect(page).to have_link 'Escolas'
    click_link 'Escolas'
    expect(current_path).to eq(schools_path)

    # Click navbar home link
    expect(page).to have_link 'Desafio Edools'
    click_link 'Desafio Edools'
    expect(current_path).to eq(root_path)

    # Visit courses index
    expect(page).to have_link 'Cursos'
    click_link 'Cursos'
    expect(current_path).to eq(courses_path)
    visit root_path

    # Visit students index
    expect(page).to have_link 'Alunos'
    click_link 'Alunos'
    expect(current_path).to eq(students_path)
    visit root_path
  end
end
