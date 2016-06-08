require "rails_helper"

RSpec.describe CoursesController, type: :routing do
  describe 'routing' do
    it { should route(:get, '/cursos').to(action: :index) }
    it { should route(:get, '/cursos/novo').to(action: :new) }
    it { should route(:get, '/cursos/1').to(action: :show, id: 1) }
    it { should route(:get, '/cursos/1/editar').to(action: :edit, id: 1) }
    it { should route(:post, '/cursos').to(action: :create) }
    it { should route(:patch, '/cursos/1').to(action: :update, id: 1) }
    it { should route(:put,   '/cursos/1').to(action: :update, id: 1) }
    it { should route(:delete, '/cursos/1').to(action: :destroy, id: 1) }
  end
end
