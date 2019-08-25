require 'rails_helper'

RSpec.describe RelatoriosController, type: :controller do
  it 'responds successfully' do
    get :alunos_ativos
    expect(response).to be_success
  end

  it 'returns 200 response' do
    get :alunos_ativos
    expect(response).to have_http_status(200)
  end
end
