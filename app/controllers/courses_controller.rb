class CoursesController < ApplicationController
  before_action :set_course, except: [:index, :new, :create]

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
    @params.update(course_params)
  end

  def destroy
    @course.destroy
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(
      :title, :school_id, :description, :duration,
      :duration_unit, :creation_date, :price
    )
  end
end