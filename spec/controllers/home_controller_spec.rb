require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'Render index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #search' do
    it 'returns http success' do
      get :search
      expect(response).to have_http_status(:success)
    end

    it 'render search template' do
      get :search
      expect(response).to render_template(:search)
    end
  end

end
