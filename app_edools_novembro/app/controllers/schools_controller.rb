class SchoolsController < ApplicationController
  before_action :find_school, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def new
    @school = current_user.schools.build
  end

  def create
    @school = current_user.schools.build(school_params)

    respond_to do |format|
      if @school.save
        format.html { redirect_to root_path, notice: "Escola criada com sucesso" }
        format.json { render :show, status: :created, location: @school }
      else
        format.html { render :new }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @students = @school.students
  end

  def edit
  end

  def update
    respond_to do |format|
      if @school.update(school_params)
        format.html { redirect_to @school, notice: "Escola atualizada com sucesso" }
        format.json { render :show, status: :ok, location: @school }
      else
        format.html { render :edit }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @school.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: "Escola apagada com sucesso" }
      format.json { head :no_content }
    end
  end

  def lista_geral
    @school = School.find(params[:school_id])
    @students = @school.students
  end

  private

  def school_params
    params.require(:school).permit(:name, :email, :pitch, :subdomain)
  end

  def find_school
    @school = School.find(params[:id])
  end
end
