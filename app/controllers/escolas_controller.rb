class EscolasController < ApplicationController
  before_action :set_escola, only: [:show, :edit, :update, :destroy]

  # GET /escolas
  # GET /escolas.json
  def index
    @escolas = Escola.all
  end

  # GET /escolas/1
  # GET /escolas/1.json
  def show
  end

  def buscar
    nome_a_buscar = "%#{params[:nome]}%"
#    @escolas = Escola.where "nome like ?", "%#{@nome}%"
    @escolas = Escola.where "nome like ?", nome_a_buscar
    # if @escolas.size > 0
    #   redirect_to "show"
    # else
    #   render "index"
    # end
  end

  # GET /escolas/new
  def new
    @escola = Escola.new
  end

  # GET /escolas/1/edit
  def edit
  end

  # POST /escolas
  # POST /escolas.json
  def create
    @escola = Escola.new(escola_params)

    respond_to do |format|
      if @escola.save
        format.html { redirect_to @escola, notice: 'Escola foi cadastrada com sucesso' }
        format.json { render :show, status: :created, location: @escola }
      else
        format.html { render :new }
        format.json { render json: @escola.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /escolas/1
  # PATCH/PUT /escolas/1.json
  def update
    respond_to do |format|
      if @escola.update(escola_params)
        format.html { redirect_to @escola, notice: 'Escola foi atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @escola }
      else
        format.html { render :edit }
        format.json { render json: @escola.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /escolas/1
  # DELETE /escolas/1.json
  def destroy
    @escola.destroy
    respond_to do |format|
      format.html { redirect_to escolas_url, notice: 'Escola foi excluida com sucesso.' }
      format.json { head :no_content }
    end
  end

  def alunos_ativos
    @escolas_cursos = Escola.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_escola
      @escola = Escola.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def escola_params
      params.require(:escola).permit(:nome, :email, :pitch, :subdominio, :data_criacao)
    end
end
