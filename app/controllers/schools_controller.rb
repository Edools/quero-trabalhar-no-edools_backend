class SchoolsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_school, only: [:show, :edit, :update, :destroy]

  add_breadcrumb I18n.t('dashboard'), :root_path
  add_breadcrumb I18n.t('schools'), :schools_path, only: [:index, :show, :new, :edit]
  
  # GET /schools
  # GET /schools.json
  def index
    @schools = School.search(params[:search]).page(params[:page])
    @search_form = true
  end
  
  def active_students
    add_breadcrumb 'Relatório: Alunos ativos - por escola', :school_active_students_path    
    respond_to do |format|
      format.html do
        @schools = School.select('schools.name, sum(courses.active_students) as total_active_students').joins(:courses).group('schools.id').order('schools.name').page(params[:page])
      end
      format.pdf do
        @schools = School.select('schools.name, sum(courses.active_students) as total_active_students').joins(:courses).group('schools.id').order('schools.name')
        render pdf: "file_name"   # Excluding ".pdf" extension.
      end
    end
  end

  # GET /schools/1
  # GET /schools/1.json
  def show
    add_breadcrumb I18n.t('show') + ' #' + @school.id.to_s
  end

  # GET /schools/new
  def new
    add_breadcrumb I18n.t('new_school')
    @school = School.new
  end

  # GET /schools/1/edit
  def edit
    add_breadcrumb I18n.t('edit') + ' #' + @school.id.to_s
  end

  # POST /schools
  # POST /schools.json
  def create
    @school = School.new(school_params)

    respond_to do |format|
      if @school.save
        format.html { redirect_to @school, notice: t('alerts.successfully_created', model: t('school')) }
        format.json { render :show, status: :created, location: @school }
      else
        format.html { render :new }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schools/1
  # PATCH/PUT /schools/1.json
  def update
    respond_to do |format|
      if @school.update(school_params)
        format.html { redirect_to @school, notice: t('alerts.successfully_updated', model: t('school')) }
        format.json { render :show, status: :ok, location: @school }
      else
        format.html { render :edit }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schools/1
  # DELETE /schools/1.json
  def destroy
    @school.destroy
    respond_to do |format|
      format.html { redirect_to schools_url, notice: t('alerts.successfully_destroyed', model: t('school')) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school
      @school = School.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_params
      params.require(:school).permit(:name, :owner_email, :pitch, :subdomain)
    end
end