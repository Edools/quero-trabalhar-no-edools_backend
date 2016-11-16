require 'rails_helper'

RSpec.describe 'schools/show', type: :view do
  before(:each) do
    @school = assign(:school, create(:school))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Escola/)
    expect(rendered).to match(/dono@escola.com.br/)
    expect(rendered).to match(/Nossa escola/)
    expect(rendered).to match(/escola.edools.com/)
  end
end
