class CoursesController < ApplicationController
  def new
    @school = School.find(params[:school_id])
  end

  def create
    @school = School.find(params[:school_id])
    @course = @school.courses.create(course_params)

    if @course.save
      redirect_to @school
    else
      render :new
    end
  end

  def destroy
    @school = School.find(params[:school_id])
    @course = @school.courses.find(params[:id])
    @course.destroy
    redirect_to school_path(@school), :notice => t('flash.notice.course_destroyed')
  end

  private
    def course_params
      params.require(:course).permit(:title, :school, :description, :content, :duration, :price)
    end
end
