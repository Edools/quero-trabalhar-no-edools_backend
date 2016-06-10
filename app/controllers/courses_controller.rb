class CoursesController < ApplicationController
  before_action :load_school
  before_action :load_course, except: [:index, :new, :create]

  def index
    @courses = @school.courses
  end

  def new
    @course = @school.courses.build
  end

  def create
    @course = @school.courses.new(course_params)
    if @course.save
      redirect_to school_course_path(@school, @course)
    else
      render :new
    end
  end

  def show

  end

  def edit

  end

  def update
    if @course.update_attributes(course_params)
      redirect_to school_course_path(@school, @course)
    else
      render :edit
    end
  end

  def destroy
    @course.destroy
    redirect_to school_courses_path(@school)
  end

  private
  def course_params
    params.require(:course).permit(:title, :school_id, :description, :content, :duration, :price, :total_active_students)
  end

  def load_school
    @school = School.find(params[:school_id])
  end

  def load_course
    @course = @school.courses.find(params[:id])
  end
end
