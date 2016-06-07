class CoursesController < ApplicationController
  before_action :find_school_course, only: [:show, :edit, :update, :destroy]

  def new
    @course = Course.new
  end

  def create
    @school = School.find(params[:id])
    @course = @school.courses.create!(params[:course].permit(:title, :description, :content, :duration, :created_at, :price))

    redirect_to school_path(@school)
  end

  def edit
  end

  def update
    if @course.update(course_params)
      redirect_to school_path(@school)
    else
      render 'edit'
    end
  end

  def destroy
    @course.destroy
    redirect_to school_path(@school)
  end

  private
  def course_params
    @course = params.require(:course).permit(:title, :description, :content, :duration, :created_at, :price)
  end

  def find_school_course
    @course = Course.find(params[:id])
    @school = @course.school_id
  end
end
