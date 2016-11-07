class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]
  before_action :check_owner_school, only: [:show, :index]
  before_action :redirect_if_not_owner, only: [:new, :create, :edit, :destroy]
  respond_to :html

  def index
    @course = Course.find(params[:course_id])
    @lessons = @course.lessons.order(:id)
    respond_with(@lessons)
  end

  def show
    @course = Course.find(params[:course_id])
    respond_with(@lesson)
  end

  def new
    @course = Course.find(params[:course_id])
    @lesson = Lesson.new
    respond_with(@lesson)
  end

  def edit
    @course = Course.find(params[:course_id])
  end

  def create
    @course = Course.find(params[:course_id])
    @lesson = Lesson.new(lesson_params)
    @lesson.course_id = @course.id
    @lesson.save
    redirect_to course_lessons_path(@course)
  end

  def update
    @course = Course.find(params[:course_id])
    @lesson.update(lesson_params)
    redirect_to course_lessons_path(@course)
  end

  def destroy
    @lesson.destroy
    redirect_to :back
  end

  def redirect_if_not_owner
    course = Course.find(params[:course_id])
    school = course.school
    owner = school.user
    
    if current_user
      if current_user.school
        if current_user != owner
          redirect_to root_path
        end
      end
    else
      redirect_to root_path
    end
  end



  private
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    def lesson_params
      params.require(:lesson).permit(:title, :description, :course_id)
    end



end
