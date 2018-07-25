class SchoolsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_school, only: [:show, :edit, :update, :destroy]

  # GET /schools
  def index
    @schools = current_user.schools.by_name(params[:name]).order(:name).page(params[:page]).per(10)
  end

  # GET /schools/1
  def show
  end

  # GET /schools/new
  def new
    @school = School.new
  end

  # GET /schools/1/edit
  def edit
  end

  # POST /schools
  def create
    @school = current_user.schools.new(school_params)

    if @school.save
      redirect_to @school, notice: I18n.t('defaults.created_with_model', model_name: School.model_name.human)
    else
      render :new
    end
  end

  # PATCH/PUT /schools/1
  def update
    if @school.update(school_params)
      redirect_to @school, notice: I18n.t('defaults.updated_with_model', model_name: School.model_name.human)
    else
      render :edit
    end
  end

  # DELETE /schools/1
  def destroy
    @school.destroy
    redirect_to schools_url, notice: I18n.t('defaults.deleted_with_model', model_name: School.model_name.human)
  end

  private
    def set_school
      @school = current_user.schools.find(params[:id])
    end

    def school_params
      params.require(:school).permit(:name, :pitch, :subdomain)
    end
end
