class CursosController < ApplicationController
  before_action :set_curso, only: [:show, :edit, :update, :destroy]
  before_action :set_escola

  # GET /cursos
  # GET /cursos.json
  def index
    if params[:busca] && !params[:busca].values.map(&:length).sum.zero? 
      @cursos = Curso.busca params[:busca]
    else
      @cursos = Curso.all
    end
  end

  # GET /cursos/1
  # GET /cursos/1.json
  def show
  end

  # GET /cursos/new
  def new
    @curso = Curso.new
  end

  # GET /cursos/1/edit
  def edit
  end

  # POST /cursos
  # POST /cursos.json
  def create
    @curso = Curso.new(curso_params)
    @curso.escola = @escola
    respond_to do |format|
      if @curso.save
        format.html { redirect_to escola_curso_path(@escola, @curso), notice: 'Curso was successfully created.' }
        format.json { render action: 'show', status: :created, location: @curso }
      else
        format.html { render action: 'new' }
        format.json { render json: @curso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cursos/1
  # PATCH/PUT /cursos/1.json
  def update
    @curso.escola = @escola
    respond_to do |format|
      if @curso.update(curso_params)
        format.html { redirect_to escola_curso_path(@escola, @curso), notice: 'Curso was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @curso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cursos/1
  # DELETE /cursos/1.json
  def destroy
    @curso.destroy
    respond_to do |format|
      format.html { redirect_to escola_curso_path(@escola, @curso) }
      format.json { head :no_content }
    end
  end

  private

    def set_escola
      @escola = Escola.find(params[:escola_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_curso
      @curso = Curso.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def curso_params
      params.require(:curso).permit(:titulo, :descricao, :conteudo, :duracao, :alunos_ativos, :preco)
    end
end
