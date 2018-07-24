class CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  def index
    @courses = current_user.courses.all
  end

  # GET /courses/1
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
    load_schools
  end

  # GET /courses/1/edit
  def edit
    load_schools
  end

  # POST /courses
  def create
    @course = current_user.courses.new(course_params)

    if @course.save
      redirect_to @course, notice: 'Course was successfully created.'
    else
      load_schools
      render :new
    end
  end

  # PATCH/PUT /courses/1
  def update
    if @course.update(course_params)
      redirect_to @course, notice: 'Course was successfully updated.'
    else
      load_schools
      render :edit
    end
  end

  # DELETE /courses/1
  def destroy
    @course.destroy
    redirect_to courses_url, notice: 'Course was successfully destroyed.'
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
