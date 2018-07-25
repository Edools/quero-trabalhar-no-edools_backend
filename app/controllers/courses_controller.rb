class CoursesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource param_method: :course_params
  before_action :set_course, only: [:edit, :update, :destroy, :show]
  
  def index
    @course = CourseQuery.relation.by_title(params[:search_title])
                                  .by_school(params[:search_school])
                                  .page_index(params[:page])
                                  .order_index
                                  .includes(:school)
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save!
      redirect_to @course
    else
      render :new, notice: @course.errors 
    end
  end

  def show
    @course = CoursesFacade.new(params[:id])
  end

  def edit
  end

  def update
    if @course.update(course_params)
      redirect_to @course
    else
      render :edit, notice: @course.errors
    end
  end
  
  def destroy
    if @course.destroy
      redirect_to courses_path
    end
  end

  private

    def set_course
      @course = Course.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:title, :duration, :content, 
                                    :description, :price, :school_id)
                                    .merge(user: current_user)
    end
end
