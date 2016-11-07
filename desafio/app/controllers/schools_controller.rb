class SchoolsController < ApplicationController

  def pesquisar_escolas
    @schools = School.nome(params[:nome])
  end

  def relatorio_ativos
    @schools = School.all
  end

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

  def edit
    @school = School.find(params[:id])
  end

  def update
    @school = School.find(params[:id])
    if @school.update(school_params)
      redirect_to @school, notice: "Escola atualizada com sucesso."
    else
      flash[:alert] = "Erro ao atualizar a Escola"
      render "new"
    end
  end

  def destroy
    @school = School.find(params[:id])
    if @school.destroy
      redirect_to root_path, notice: "Escola excluída com sucesso."
    else
      redirect_to root_path, alert: "Erro ao excluir a Escola."
    end

  end

  private

  def school_params
    params.require(:school).permit(:nome,:email_dono,:pitch,:sub_dominio,:data_criacao, courses_attributes: [:id, :titulo, :descricao, :duracao, :data_criacao, :alunos_ativos, :preco, :_destroy])
  end
end
