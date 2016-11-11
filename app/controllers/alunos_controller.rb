class AlunosController < ApplicationController
  def index
    @escola = Escola.find(params[:escola_id])
    @alunos = @escola.alunos.all
  end

  def show
    @escola = Escola.find(params[:escola_id])
    @aluno = Aluno.find(params[:id])
  end

  def new
    @escola = Escola.find(params[:escola_id])
    @aluno = @escola.alunos.build
  end

  def edit
    @escola = Escola.find(params[:escola_id])
    @aluno = Aluno.find(params[:id])
  end

  def create
    @escola = Escola.find(params[:escola_id])
    @aluno = @escola.alunos.create(aluno_params)
    if @aluno.save
      redirect_to escola_alunos_path(@escola)
    else
      render 'new'
    end
  end

  def update
    @escola = Escola.find(params[:escola_id])
    @aluno = Aluno.find(params[:id])
    if @aluno.update(aluno_params)
      redirect_to escola_alunos_path(@escola)
    else
      render 'edit'
    end
  end

  def destroy
    @aluno = Aluno.find(params[:id])
    @aluno.destroy
    redirect_to alunos_path
  end

  private
    def aluno_params
      params.require(:aluno).permit(:nome)
    end
end
