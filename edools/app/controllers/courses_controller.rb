class CoursesController < ApplicationController
  def new
    @course = School.find(params[:school_id]).courses.build 
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to @course
    else
      render :new
    end
  end

  private
    def course_params
      params.require(:course).permit(:title, :school, :description, :content, :duration, :price)
    end
end
