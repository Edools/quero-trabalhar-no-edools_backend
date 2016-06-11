require 'spec_helper'

include Warden::Test::Helpers

module RequestHelpers
  def login(user)
    login_as user, scope: :user
  end
end
