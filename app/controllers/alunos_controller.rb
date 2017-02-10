class AlunosController < ApplicationController
  def index
      @alunos = Aluno.all
  end

  def show
    @aluno = Aluno.find(params[:id])
  end

  def new
    @aluno = Aluno.new
  end

  def edit
    @aluno = Aluno.find(params[:id])
  end

  def create
    @aluno = Aluno.new(aluno_params)
    @aluno.data_criacao = Date.today
    if @aluno.save
      redirect_to @aluno
    else
      render 'new'
    end
  end

  def update
    @aluno = Aluno.find(params[:id])
    if @aluno.update(aluno_params)
      redirect_to @aluno
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
