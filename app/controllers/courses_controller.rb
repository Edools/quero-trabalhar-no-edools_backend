class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
    @q       = Course.ransack(params[:q])
    @courses = @q.result.includes(:school)
  end

  def filter
    @courses = Course.order('title')
    @courses = @courses.where('school_id = ?', params[:q]) if params[:q].to_i != 0
    render :index
  end

  def show
  end

  def new
    @course = Course.new
  end

  def edit
  end

  def create
    @course = Course.create(course_params)
    respond_with(@course)
  end

  def update
    @course.update_attributes(course_params)
    respond_with(@course)
  end

  def destroy
    @course.destroy
    respond_with(@course)
  end

  private
  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :description, :content, :duration, :active_students, :price, :school_id)
  end
end
