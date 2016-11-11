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

    # Destroy
    expect { click_link 'Excluir' }.to change(School, :count).by(-1)
  end

  scenario 'updating' do
    school = FactoryGirl.create(:school)

    # Update
    visit edit_school_path(school)
    fill_in 'school_name', with: 'Novo nome de Escola'
    submit_form
    expect(current_path).to eq(schools_path)
    expect(page).to have_content 'Novo nome de Escola'
  end

  scenario 'searching by name' do
    school_stanford = FactoryGirl.create(:school, name: 'Stanford')
    school_mit = FactoryGirl.create(:school, name: 'Mit')

    visit schools_path
    expect(page).to have_content school_stanford.name
    fill_in 'q', with: school_mit.name
    submit_form_by_button
    expect(page).to have_content school_mit.name
    expect(page).to have_no_content school_stanford.name
  end
end
