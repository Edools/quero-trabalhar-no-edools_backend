class CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  
  add_breadcrumb I18n.t('dashboard'), :root_path
  add_breadcrumb I18n.t('all_courses'), :courses_path, :only => %w(index)
  
  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.includes(:school).search(params[:search]).page(params[:page])
    @search_form = true
  end
  
  def by_school 
    school = set_school
    @courses = Course.includes(:school).where(school_id: school.id).search(params[:search]).page(params[:page])
    add_breadcrumb I18n.t('school') + ' #' + school.id.to_s, school_path(school)
    add_breadcrumb I18n.t('courses'), school_courses_path(school)
    @search_form = true
  end
  
  # GET /courses/1
  # GET /courses/1.json
  def show
    add_breadcrumb I18n.t('show') + ' #' + @course.id.to_s
  end

  # GET /courses/new
  def new
    
    @course = Course.new
    school = set_school
    if school.present?
      @course.school = school
      add_breadcrumb I18n.t('school') + ' #' + school.id.to_s, school_path(school)
      add_breadcrumb I18n.t('courses'), school_courses_path(school)
      add_breadcrumb I18n.t('new_course'), new_school_courses_path(school)
    else
      add_breadcrumb I18n.t('courses'), courses_path
      add_breadcrumb I18n.t('new_course'), new_course_path
    end
  end

  # GET /courses/1/edit
  def edit
    add_breadcrumb I18n.t('edit') + ' #' + @course.id.to_s
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: t('successfully_created', mode: t('course')) }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: t('alerts.successfully_updated', model: t('course')) }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: t('alerts.successfully_destroyed', model: t('course')) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end
  
    def set_school
      school = nil
      if params[:school_id].present?
        school = School.find(params[:school_id])
      end
    end
  
    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:title, :school_id, :description, :content, :duration, :price)
    end
end
