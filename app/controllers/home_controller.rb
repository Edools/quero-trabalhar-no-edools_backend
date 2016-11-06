# encoding:utf-8
class HomeController < ApplicationController

  before_action :find_matricula, only: [:matricula_escola, :matricular, :cancelar_matricula]

  def index
  end

  def matriculas
    @escolas = Escola.all
  end

  def matricula_escola
  end

  def matricular
    @aluno = Aluno.find(params[:aluno_id])

    unless @curso.alunos.include? @aluno
      @curso.alunos << @aluno
      find_matricula
      flash.now[:success] = "Matricula efetuada com sucesso!"
    else
      flash.now[:alert] = "Aluno já matriculado!"
    end

    render :matricula_escola
  end

  def cancelar_matricula
    @curso.alunos.delete(Aluno.find(params[:aluno_id]))
    flash[:success] = "Matricula cancelada com sucesso!"
    redirect_to :matricula_escola
  end

  private

  def find_matricula
    @escola = Escola.find(params[:id])
    @curso = Curso.find(params[:curso_id])
    @alunos = Aluno.where(status: 1) - @curso.alunos
    @matriculas = @curso.alunos
  end
end
