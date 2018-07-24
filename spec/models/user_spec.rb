require 'rails_helper'

RSpec.describe User, type: :model do
  it 'user admin' do
    user = create(:user, input_roles: 'Administrador')
    expect(user.has_role? 'admin').to be_truthy
  end

  it 'user is not admin' do
    user = create(:user, input_roles: '')
    expect(user.has_role? 'standart_user').to be_truthy
  end
end
