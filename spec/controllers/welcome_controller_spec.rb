require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  render_views
  subject { response }

  describe "GET #index" do
    before { get :index }
    it { is_expected.to have_http_status(:success) }
    it { is_expected.to render_template :index }
  end
end
