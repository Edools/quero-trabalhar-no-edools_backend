require 'rails_helper'

RSpec.describe 'schools/index', type: :view do
  before(:each) do
    assign(:schools, [create(:school), create(:school)])
  end

  it 'renders a list of schools' do
    render
    assert_select 'tr>td', :text => 'Escola'.to_s, :count => 2
    assert_select 'tr>td', :text => 'dono@escola.com.br'.to_s, :count => 2
    assert_select 'tr>td', :text => 'Nossa escola'.to_s, :count => 2
    assert_select 'tr>td', :text => 'escola.edools.com'.to_s, :count => 2
  end
end
