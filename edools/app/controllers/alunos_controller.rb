class AlunosController < ApplicationController
  before_action :set_aluno, only: [:show, :edit, :update, :destroy]

  def index
    if params[:q].nil?
      @alunos = Aluno.all
    else
      @alunos = Aluno.search(params[:q])
    end
  end

  def show
  end

  def new
    @aluno = Aluno.new
    @cursos = Curso.all
  end

  def edit
    @cursos = Curso.all
  end

  def create
    @cursos = Curso.all
    @aluno = Aluno.new(aluno_params)
    @aluno.escola = Escola.find(@aluno.curso.escola.id)
    respond_to do |format|
      if @aluno.save
        format.html { redirect_to @aluno, notice: 'Aluno was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @cursos = Curso.all
    respond_to do |format|
      if @aluno.update(aluno_params)
        format.html { redirect_to @aluno, notice: 'Aluno was successfully updated.' }
        format.json { render :show, status: :ok, location: @aluno }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @aluno.destroy
    respond_to do |format|
      format.html { redirect_to alunos_url, notice: 'Aluno was successfully destroyed.' }
    end
  end

  private
    def set_aluno
      @aluno = Aluno.find(params[:id])
    end

    def aluno_params
      params.require(:aluno).permit(:nome, :email, :curso_id, :escola_id, :ativo)
    end
end
