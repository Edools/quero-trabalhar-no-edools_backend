require 'rails_helper'

RSpec.describe PrincipalController, type: :controller do
  it 'responds successfully' do
    get :index
    expect(response).to be_success
  end

  it 'returns 200 response' do
    get :index
    expect(response).to have_http_status(200)
  end
end
