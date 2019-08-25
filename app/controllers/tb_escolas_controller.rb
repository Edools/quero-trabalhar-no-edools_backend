class TbEscolasController < ApplicationController
  helper_method :sort_column, :sort_direction

  before_action :set_tb_escola, only: %i(show edit update destroy)
  before_action :add_breadcrumb_modulo

  # GET escolas
  def index
    add_breadcrumb 'Principal', tb_escolas_path

    @q, @tb_escolas = TbEscolaFinder.new(params.merge(paginate: true))
                          .all
  end

  # GET escolas/1
  def show
    add_breadcrumb 'Visualizar', tb_escola_path(@tb_escola)
  end

  # GET escolas/new
  def new
    add_breadcrumb 'Novo', new_tb_escola_path
    @tb_escola = TbEscola.new
  end

  # GET escolas/1/edit
  def edit
    add_breadcrumb 'Editar', edit_tb_escola_path(@tb_escola)
  end

  # POST escolas
  def create
    @tb_escola = TbEscola.new(tb_escolas_params)

    if @tb_escola.save
      redirect_to tb_escolas_path,
                  notice: specific_alert(:success_created)
    else
      buscas_listas_para_select
      render action: 'new'
    end
  end

  # PATCH/PUT escolas/1
  def update
    if @tb_escola.update(tb_escolas_params)
      redirect_to tb_escolas_path,
                  notice: specific_alert(:success_updated)
    else
      buscas_listas_para_select
      render action: 'edit'
    end
  end

  # DELETE escolas/1
  def destroy
    if @tb_escola.destroy
      flash[:notice] = specific_alert(:success_destroyed)
    else
      flash[:danger] = specific_alert(:unsuccess_destroyed)
    end
    redirect_to tb_escolas_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tb_escola
    @tb_escola = TbEscola.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def tb_escolas_params
    params.require(:tb_escola)
        .permit(:nome, :email_dono, :pitch, :subdominio, :logo,
                tb_cursos_attributes: [:id, :titulo, :descricao, :conteudo, :duracao, :qtd_alunos_ativos, :preco, :_destroy])
  end

  def add_breadcrumb_modulo
    add_breadcrumb breadcrumb('administracao.escola.base'), tb_escolas_path
  end

  def sort_column
    TbEscola.column_names.include?(params[:sort]) ? params[:sort] : 'nome'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end
end
