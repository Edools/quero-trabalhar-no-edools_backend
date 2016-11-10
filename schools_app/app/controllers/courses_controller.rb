class CoursesController < ApplicationController
  add_breadcrumb 'Cursos', :courses_path

  def index
    @courses = Course.order(updated_at: :desc).all
  end

  def new
    add_breadcrumb 'Novo'
    @course = Course.new
  end

  def edit
    add_breadcrumb 'Editar'
    @course = set_course
  end

  def create
    add_breadcrumb 'Novo'
    @course = Course.create(course_params)
    respond_with @course
  end

  def update
    add_breadcrumb 'Editar'
    @course = set_course
    @course.update(course_params)
    respond_with @course
  end

  def destroy
    @course = set_course
    @course.destroy
    respond_with @course
  end

  private

  def set_course
    Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :school_id, :description, :content, :duration, :price)
  end
end
