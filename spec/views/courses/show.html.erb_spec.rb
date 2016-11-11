require 'rails_helper'

RSpec.describe 'courses/show', type: :view do
  before(:each) do
    @course = assign(:course, create(:course))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Curso/)
    expect(rendered).to match(/Só um curso/)
    expect(rendered).to match(/Aprender algo/)
    expect(rendered).to match(/1 ano/)
    expect(rendered).to match(/10/)
    expect(rendered).to match(/1000.0/)
  end
end
