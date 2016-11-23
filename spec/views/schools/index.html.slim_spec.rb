require 'rails_helper'

RSpec.describe 'schools/index', type: :view do
  let(:attributes) do
    { name: 'School Name', owner_email: 'foo@bar.com',
      pitch: 'My Text', subdomain: 'subdomain' }
  end

  before(:each) { assign(:schools, [create(:valid_school, attributes), create(:valid_school, attributes)]) }

  it 'renders a list of schools' do
    render
    assert_select 'tr>td', text: attributes[:name].to_s, count: 2
    assert_select 'tr>td', text: attributes[:owner_email].to_s, count: 2
    assert_select 'tr>td', text: attributes[:pitch].to_s, count: 2
    assert_select 'tr>td', text: attributes[:subdomain].to_s, count: 2
  end
end
