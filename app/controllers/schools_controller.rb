class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :edit, :update, :destroy]

  def index
    # Providing simple search
    if params[:name]
      @schools = School.where(name: params[:name])
    else
      @schools = School.all
    end
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)
    if @school.save
      redirect_to @school, notice: 'Escola salva com sucesso'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @school.update_attributes(school_params)
      redirect_to @school, notice: 'Escola salva com sucesso'
    else
      render :edit
    end

  end

  def show
  end

  def destroy
    if @school.destroy
      redirect_to schools_url, notice: "#{@school.name} foi apagada com sucesso."
    else
      redirect_to :back, alert: 'A escola não pôde ser apagada'
    end
  end

  private

  def set_school
    @school = School.find(params[:id])
  end

  def school_params
    params.require(:school).permit(:name, :owner_email, :pitch)
  end
end
