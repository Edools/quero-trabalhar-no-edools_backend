class CoursesController < ApplicationController
  before_action :set_course, except: [:index, :new, :create, :search]
  before_action :set_school, only: [ :new, :create, :edit, :update]
  def index
    @courses = Course.all.page(params[:page])
  end

  def search
    @courses = Course.by_title(params[:search]).by_school_name(params[:name])
  end

  def show; end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    @course.save
  end

  def edit; end

  def update
    @course.update(course_params)
  end

  def destroy
    @course.destroy
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def set_school
    @school = School.find(params[:school_id])
  end

  def course_params
    params.require(:course).permit(
      :title, :school_id, :description, :duration,
      :duration_unit, :creation_date, :price, :school_id, :active_students
    )
  end
end
