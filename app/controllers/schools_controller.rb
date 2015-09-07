class SchoolsController < ApplicationController
  before_action :set_school, only: [:edit, :update, :destroy]

  def index
    @schools = School.all
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)

    if @school.save
      redirect_to schools_path, notice: 'Salvo com sucesso'
    else
      render :new
    end
  end

  def edit
    @school = School.find(params[:id])
  end

  def update
    if @school.update(school_params)
      redirect_to schools_path, notice: 'Atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @school.destroy

    redirect_to schools_path, notice: 'Excluído com sucesso.'
  end

  private

  def set_school
    @school = School.find(params[:id])
  end

  def school_params
    params.require(:school).permit(:name, :owner_email, :pitch, :subdomain)
  end
end
