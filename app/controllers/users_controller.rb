class UsersController < ApplicationController
  before_action :authenticate_user!
  
  add_breadcrumb I18n.t('dashboard'), :root_path
  add_breadcrumb I18n.t('users'), :users_path
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end

end