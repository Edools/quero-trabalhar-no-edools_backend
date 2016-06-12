class CoursesController < ApplicationController
  before_action :set_school
  before_action :set_course, only: [:edit, :update, :destroy]

  def index
    @courses = @school.courses.all.order(:description)
  end

  def show
  end

  def new
    @course = @school.courses.build
  end

  def edit
  end

  def create
    @course = @school.courses.build(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to school_courses_path(school_id: @school), notice: 'Course was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to school_courses_path(school_id: @school), notice: 'Course was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to school_courses_path(school_id: @school), notice: 'Course was successfully destroyed.' }
    end
  end

  private

  def set_course
    @course = @school.courses.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :school, :description, :content, :duration, :price)
  end

  def set_school
    @school = School.find params[:school_id]
  end
end
