class CoursesController < ApplicationController
  before_filter :load_course, only: [:show, :destroy]

  def index
    @courses = Course.by_name(params[:search])
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def show
  end

  def destroy
    redirect_to action: :index if @course.destroy
  end

  private

  def course_params
    params.require(:course).permit(:id, :school_id, :title, :description, :content,
      :length, :price)
  end

  def load_course
    @course = Course.find_by(id: params[:id])
  end
end
