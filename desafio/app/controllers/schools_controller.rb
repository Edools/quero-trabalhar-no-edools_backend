class SchoolsController < ApplicationController
  def new
    @school = School.new
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

  private

  def school_params
    params.require(:school).permit(:nome,:email_dono,:pitch,:sub_dominio,:data_criacao)
  end
end
