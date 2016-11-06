class SchoolsController < ApplicationController

  def index
    @schools = School.all
  end

  def new
    @school = School.new
    @school.courses.build
  end

  def create
    @school = School.new(school_params)
    if @school.save
      redirect_to @school, notice: "Escola cadastrada com sucesso."
    else
      flash[:alert] = "Erro ao cadastrar a escola."
      render "new"
    end
  end

  def show
    @school = School.find(params[:id])
  end

  private

  def school_params
    params.require(:school).permit(:nome,:email_dono,:pitch,:sub_dominio,:data_criacao, courses_attributes: [:id, :titulo, :descricao, :duracao, :data_criacao, :alunos_ativos, :preco, :_destroy])
  end
end
