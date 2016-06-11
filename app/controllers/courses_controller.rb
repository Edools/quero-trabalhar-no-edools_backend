class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :set_school

  respond_to :html

  def index
    courses_to_decorate = Course.with_schools(@school)
    @courses = CourseDecorator.decorate_collection(courses_to_decorate)
    respond_with(@courses)
  end

  def show
    respond_with(@course)
  end

  def new
    @course = CourseForm.new
    respond_with @course
  end

  def edit
  end

  def create
    @course = CourseForm.new(params[:course_form], @school)
    @course.save
    respond_with @course, location: -> { school_courses_path(@school) }
  end

  def update
    @course_form = CourseForm.new(params, @school, @course)
    @course_form.update
    respond_with @course, location: -> { school_courses_path(@school) }
  end

  def destroy
    @course.destroy
    respond_with @course, location: -> { school_courses_path(@school) }
  end

  private
    def set_course
      @course = Course.find(params[:id])
    end

    def set_school
      @school = School.find(params[:school_id])
    end
end
