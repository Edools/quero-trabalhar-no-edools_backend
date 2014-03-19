class EscolasController < ApplicationController
  before_action :set_escola, only: [:show, :edit, :update, :destroy]

  # GET /escolas
  # GET /escolas.json
  def index
    if params[:busca] && !params[:busca].values.map(&:length).sum.zero? 
      @escolas = Escola.busca params[:busca]
    else
      @escolas = Escola.all
    end
  end

  # GET /escolas/1
  # GET /escolas/1.json
  def show
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
        format.html { redirect_to @escola, notice: 'Escola was successfully created.' }
        format.json { render action: 'show', status: :created, location: @escola }
      else
        format.html { render action: 'new' }
        format.json { render json: @escola.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /escolas/1
  # PATCH/PUT /escolas/1.json
  def update
    respond_to do |format|
      if @escola.update(escola_params)
        format.html { redirect_to @escola, notice: 'Escola was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @escola.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /escolas/1
  # DELETE /escolas/1.json
  def destroy
    @escola.destroy
    respond_to do |format|
      format.html { redirect_to escolas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_escola
      @escola = Escola.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def escola_params
      params.require(:escola).permit(:nome, :email_do_dono, :pitch, :subdominio)
    end
end
