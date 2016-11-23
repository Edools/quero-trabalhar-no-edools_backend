class EscolasController < ApplicationController
  before_action :set_escola, only: [:show, :edit, :update, :destroy]

  def index
    if params[:q].nil?
      @escolas = Escola.all
    else
      @escolas = Escola.search(params[:q])
    end
  end

  def show
  end

  def new
    @escola = Escola.new
  end

  def edit
  end

  def create
    @escola = Escola.new(escola_params)
    @escola.data_criacao = Date.today

    respond_to do |format|
      if @escola.save
        format.html { redirect_to @escola, notice: t('flash.escola.create.notice') }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @escola.update(escola_params)
        format.html { redirect_to @escola, notice: t('flash.escola.update.notice') }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @escola.destroy
    respond_to do |format|
      format.html { redirect_to escolas_url, notice: t('flash.escola.remove.notice') }
    end
  end

  private
    def set_escola
      @escola = Escola.find(params[:id])
    end

    def escola_params
      params.require(:escola).permit(:nome, :email, :pitch, :subdominio, :data_criacao)
    end
end
