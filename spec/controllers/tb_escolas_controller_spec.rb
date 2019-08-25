require 'rails_helper'

RSpec.describe TbEscolasController, type: :controller do
  it 'index responds successfully' do
    get :index
    expect(response).to be_success
  end

  it 'index returns 200 response' do
    get :index
    expect(response).to have_http_status(200)
  end

  describe 'Filter ransak' do
    it 'consulta nome da escola' do
      q = Hash.new
      q[:nome_cont] = 'Teste'

      get :index, params: { q: q }

      expect(response).to be_success
    end

    it 'consulta nome do curso' do
      q = Hash.new
      q[:tb_cursos_titulo_cont] = 'Teste'

      get :index, params: { q: q }

      expect(response).to be_success
    end
  end

  describe 'HTTP' do
    it 'post' do
      tb_escola_params = attributes_for(:tb_escola)

      expect {
        post :create, params: { tb_escola: tb_escola_params }
      }.to change(TbEscola, :count).by(1)
    end

    it 'post with nested' do
      tb_escola_params = attributes_for(:tb_escola)
      tb_escola_params[:tb_cursos_attributes] = []
      tb_escola_params[:tb_cursos_attributes][0] = attributes_for(:tb_curso)

      expect {
        post :create, params: { tb_escola: tb_escola_params }
      }.to change(TbEscola, :count).by(1)
    end

    it 'update' do
      tb_escola_params = attributes_for(:tb_escola)
      tb_escola_params[:tb_cursos_attributes] = []
      tb_escola_params[:tb_cursos_attributes][0] = attributes_for(:tb_curso)
      post :create, params: { tb_escola: tb_escola_params }
      tb_escola = TbEscola.first

      put :update, params: { id: tb_escola.id, tb_escola: { nome: 'Teste 2'} }
      expect(flash[:notice]).to match(/atualizado com sucesso/)
    end

    it 'destroy' do
      tb_escola_params = TbEscola.create attributes_for(:tb_escola)

      expect {
        post :destroy, params: { id: tb_escola_params.id }
      }.to change(TbEscola, :count).by(-1)
    end

    it 'destroy with nested' do
      tb_escola_params = attributes_for(:tb_escola)
      tb_escola_params[:tb_cursos_attributes] = []
      tb_escola_params[:tb_cursos_attributes][0] = attributes_for(:tb_curso)
      post :create, params: { tb_escola: tb_escola_params }
      tb_escola = TbEscola.first

      expect {
        post :destroy, params: { id: tb_escola.id }
      }.to change(TbEscola, :count).by(-1)
    end

    it 'show' do
      tb_escola_params = attributes_for(:tb_escola)
      tb_escola_params[:tb_cursos_attributes] = []
      tb_escola_params[:tb_cursos_attributes][0] = attributes_for(:tb_curso)
      post :create, params: { tb_escola: tb_escola_params }
      tb_escola = TbEscola.first

      get :show, params: { id: tb_escola.id }
      expect(response).to be_success
    end
  end
end
