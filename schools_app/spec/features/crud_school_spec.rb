feature 'As an User I manage School CRUD' do
  scenario 'creating, updating and destroying' do
    school = FactoryGirl.build(:school)

    visit schools_path
    expect(page).to have_no_content school.name

    # Submit invalid
    click_link 'Nova Escola'
    fill_in 'school_name', with: school.name
    submit_form
    expect(page).to have_content 'E-mail do dono não pode ficar em branco'

    # Create
    fill_in 'school_name', with: school.name
    fill_in 'school_owner_email', with: school.owner_email
    fill_in 'school_subdomain', with: school.subdomain
    submit_form
    expect(current_path).to eq(schools_path)
    expect(page).to have_content school.name.truncate(20)

    # Update
    visit edit_school_path(1)
    fill_in 'school_name', with: 'Novo nome de Escola'
    submit_form
    expect(page).to have_content 'Novo nome de Escola'

    # Destroy
    expect { click_link 'Excluir' }.to change(School, :count).by(-1)
  end
end
