require 'date'

class EscolasController < ApplicationController

  def index
      @escolas = Escola.all
  end

  def show
    @escola = Escola.find(params[:id])
  end

  def new
    @escola = Escola.new
  end

  def edit
    @escola = Escola.find(params[:id])
  end

  def create
    @escola = Escola.new(escola_params)
    @escola.data_criacao = Date.today
    if @escola.save
      redirect_to @escola
    else
      render 'new'
    end
  end

  def update
    @escola = Escola.find(params[:id])
    if @escola.update(escola_params)
      redirect_to @escola
    else
      render 'edit'
    end
  end

  def destroy
    @escola = Escola.find(params[:id])
    @escola.destroy
    redirect_to escolas_path
  end

  def active_alunos
    @escola = Escola.find(params[:id])
    @inativos = []
    @ativos = []
    if @escola.alunos.count > 0
      @escola.cursos.each do |c|
        @ativos += c.alunos
      end
      @ativos = @ativos.uniq
      @inativos = @escola.alunos - @ativos
    end
  end

  private
    def escola_params
      params.require(:escola).permit(:nome, :email_dono, :pitch, :sub_dominio)
    end
end
