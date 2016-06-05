require 'date'

class CursosController < ApplicationController
  def create
    @escola = Escola.find(params[:escola_id])
    @curso = Curso.new(curso_params)
    @curso.data_criacao = Date.today
    @escola.cursos << @curso
    redirect_to escola_path(@escola)
  end

  def destroy
    @escola = Escola.find(params[:escola_id])
    @curso = @escola.cursos.find(params[:id])
    @curso.destroy
    redirect_to escola_path(@escola)
  end

  def show
    @curso = Curso.find(params[:id])
  end

  private
  def curso_params
    params.require(:curso).permit(:titulo, :descricao, :conteudo, :duracao, :preco)
  end
end
