class CoursesController < ApplicationController
  before_action :set_course, only: %i[show edit update destroy]

  def index
    @courses = Course.joins(:school).order(created_at: :desc).page(params[:page]).per(10)

    @courses = Course.search params[:keywords], fields: [:title] if params[:keywords]
    @courses = Course.where(school_id: params[:school_id]) if params[:school_id]
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      flash[:success] = 'Course created succesfully!'
      redirect_to @course
    else
      flash[:alert] = 'Check if there are any wrong fields'
      render :new
    end
  end

  def show; end

  def edit; end

  def destroy
    @course.destroy
    flash[:success] = 'Course deleted succesfully!'

    redirect_to courses_path
  end

  def update
    if @course.update(course_params)
      flash[:success] = 'Course updated succesfully!'
      redirect_to @course
    else
      flash[:alert] = 'Check if there are any wrong fields'
      render :edit
    end
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(
      :title, :description, :content, :duration, :active_students,
      :price, :school_id
    )
  end
end
