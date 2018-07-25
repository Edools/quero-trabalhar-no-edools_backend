# frozen_string_literal: true

class CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_course, only: %i[show edit update destroy]
  before_action :load_schools, only: %i[index new edit]

  # GET /courses
  def index
    @courses = current_user.courses
                            .by_title(params[:title])
                            .by_school(params[:school_id])
                            .includes(:school)
                            .order(:title)
                            .page(params[:page])
                            .per(100)
  end

  # GET /courses/1
  def show; end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit; end

  # POST /courses
  def create
    @course = current_user.courses.new(course_params)

    if @course.save
      redirect_to @course, notice: I18n.t('defaults.created_with_model', model_name: Course.model_name.human)
    else
      load_schools
      render :new
    end
  end

  # PATCH/PUT /courses/1
  def update
    if @course.update(course_params)
      redirect_to @course, notice: I18n.t('defaults.updated_with_model', model_name: Course.model_name.human)
    else
      load_schools
      render :edit
    end
  end

  # DELETE /courses/1
  def destroy
    @course.destroy
    redirect_to courses_url, notice: I18n.t('defaults.deleted_with_model', model_name: Course.model_name.human)
  end

  private

  def set_course
    @course = current_user.courses.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:school_id, :title, :description, :content, :duration, :price)
  end

  def load_schools
    @schools = current_user.schools
  end
end
