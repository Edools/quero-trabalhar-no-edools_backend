require 'rails_helper'

RSpec.describe "schools/show", type: :view do
  before(:each) do
    @school = assign(:school, School.create!(
      :name => "Name",
      :owner_email => "Owner Email",
      :pitch => "MyText",
      :subdomain => "Subdomain"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Owner Email/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Subdomain/)
  end
end
