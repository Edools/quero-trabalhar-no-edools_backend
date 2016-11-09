feature 'Site layout', type: :feature do
   scenario 'Home link' do
    visit root_path
    expect(page).to have_link 'Desafio Edools'
  end
end
