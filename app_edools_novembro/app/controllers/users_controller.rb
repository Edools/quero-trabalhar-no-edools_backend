class UsersController < ApplicationController
  #before_action :authenticate_user!

  def index
    @schools = School.all
  end
end
