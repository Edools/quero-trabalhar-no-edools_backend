require "rails_helper"

RSpec.describe ReportsController, type: :routing do
  describe 'routing' do
    it { should route(:get, '/relatorios').to(action: :index) }
  end
end
