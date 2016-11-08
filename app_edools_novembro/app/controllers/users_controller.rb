class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @schools = School.all
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "Informações atualizadas com sucesso" }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        @user = current_user    format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:nome, :endereco, :cpf, :telefone, :email, :perfil_id, :ddd)
    end
end
