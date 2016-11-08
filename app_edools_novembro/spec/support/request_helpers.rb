require 'spec_helper'
include Warden::Test::Helpers

module RequestHelpers
  def create_logged_in_user
    user = Factory(:user)
    login(user)
    user
  end

  def login(user)
    login_as user, scope: :user
  end
end
