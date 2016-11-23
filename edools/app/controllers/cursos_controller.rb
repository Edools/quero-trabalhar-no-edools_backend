class CursosController < ApplicationController
  before_action :set_curso, only: [:show, :edit, :update, :destroy]

  def index
    if params[:q].nil?
      @cursos = Curso.all
    else
      @cursos = Curso.search(params[:q])
    end
  end

  def show
  end

  def new
    @curso = Curso.new
    @escolas = Escola.all
  end

  def edit
    @escolas = Escola.all
  end

  def create
    @escolas = Escola.all
    @curso = Curso.new(curso_params)
    @curso.data_criacao = Date.today
    respond_to do |format|
      if @curso.save
        format.html { redirect_to @curso, notice: t('flash.curso.create.notice') }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @escolas = Escola.all
    respond_to do |format|
      if @curso.update(curso_params)
        format.html { redirect_to @curso, notice: t('flash.curso.update.notice') }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @curso.destroy
    respond_to do |format|
      format.html { redirect_to cursos_url, notice: t('flash.curso.remove.notice') }
    end
  end

  private
    def set_curso
      @curso = Curso.find(params[:id])
    end

    def curso_params
      params.require(:curso).permit(:titulo, :escola_id, :descricao, :conteudo, :duracao, :data_criacao, :alunos_ativos, :preco)
    end
end
