require 'date'

class CursosController < ApplicationController
  def index
    @escola = Escola.find(params[:escola_id])
    @cursos = @escola.cursos.all
  end

  def show
    @escola = Escola.find(params[:escola_id])
    @curso = Curso.find(params[:id])
  end

  def new
    @escola = Escola.find(params[:escola_id])
    @curso = @escola.cursos.build
  end

  def edit
    @escola = Escola.find(params[:escola_id])
    @curso = Curso.find(params[:id])
  end

  def create
    @escola = Escola.find(params[:escola_id])
    @curso = Curso.new(curso_params)
    @curso.data_criacao = Date.today
    @escola.cursos << @curso
    redirect_to escola_cursos_path(@escola)
  end

  def destroy
    @escola = Escola.find(params[:escola_id])
    @curso = @escola.cursos.find(params[:id])
    @curso.destroy
    redirect_to escola_path(@escola)
  end

  def enrollment
    @escola = Escola.find(params[:escola_id])
    @curso = @escola.cursos.find(params[:id])
    @alunos = Aluno.all
    @ids = @curso.alunos.pluck(:id)
  end

  def enroll
    @escola = Escola.find(params[:escola_id])
    @curso = @escola.cursos.find(params[:id])
    @curso.alunos.clear

    alunos_ids = params[:alunos_ids].split(",")

    if alunos_ids != nil
      alunos_ids.each do |id|
        aluno = Aluno.find(id)
        @curso.alunos << aluno
      end
      redirect_to escola_curso_path(@escola, @curso)
    end
  end

  private
  def curso_params
    params.require(:curso).permit(:titulo, :descricao, :conteudo, :duracao, :preco)
  end
end
