class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @courses = Course.all
    respond_with(@courses)
  end

  def show
    if current_user.student
      if current_user.courses
         @found_course = current_user.courses.include? @course
      end
    end

    respond_with(@course)
  end

  def new
    @course = Course.new
    respond_with(@course)
  end

  def edit
  end

  def create
    @course = Course.new(course_params)
    @school_id = current_user.school.id
    @course.school_id = @school_id
    @course.save
    redirect_to school_path(@school_id)
  end

  def update
    @course.update(course_params)
    respond_with(@course)
  end

  def destroy
    @course.destroy
    respond_with(@course)
  end



  def join_course
      course = Course.find(params[:course_id])
      course_subscription = CourseSubscription.new(user_id: current_user.id, course_id: course.id)
      if course_subscription.save
        redirect_to course
      end

  end


  private
    def set_course
      @course = Course.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:title, :description, :duration, :price, :school_id)
    end
end
