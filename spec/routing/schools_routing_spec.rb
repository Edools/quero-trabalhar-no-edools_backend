require "rails_helper"

RSpec.describe SchoolsController, type: :routing do
  describe 'routing' do
    it { should route(:get, '/escolas').to(action: :index) }
    it { should route(:get, '/escolas/novo').to(action: :new) }
    it { should route(:get, '/escolas/1').to(action: :show, id: 1) }
    it { should route(:get, '/escolas/1/editar').to(action: :edit, id: 1) }
    it { should route(:post, '/escolas').to(action: :create) }
    it { should route(:patch, '/escolas/1').to(action: :update, id: 1) }
    it { should route(:put,   '/escolas/1').to(action: :update, id: 1) }
    it { should route(:delete, '/escolas/1').to(action: :destroy, id: 1) }
  end
end
