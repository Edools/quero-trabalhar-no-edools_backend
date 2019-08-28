require 'rails_helper'

feature 'user destroy school' do
  scenario 'successfully' do
    school = create(:school)

    visit school_path(school)

    expect { click_on 'Delete' }.to change(School, :count).by(-1)
  end
end
