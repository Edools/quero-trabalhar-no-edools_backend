require 'rails_helper'

RSpec.describe 'schools/edit', type: :view do
  before(:each) { @school = assign(:school, create(:valid_school)) }

  it 'renders the edit school form' do
    render

    assert_select 'form[action=?][method=?]', school_path(@school), 'post' do
      assert_select 'input#school_name[name=?]', 'school[name]'

      assert_select 'input#school_owner_email[name=?]', 'school[owner_email]'

      assert_select 'textarea#school_pitch[name=?]', 'school[pitch]'

      assert_select 'input#school_subdomain[name=?]', 'school[subdomain]'
    end
  end
end
