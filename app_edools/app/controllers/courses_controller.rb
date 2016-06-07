class CoursesController < ApplicationController

  def new
    @course = Course.new
  end

  def create
    @school = School.find(params[:id])
    @course = @school.courses.create!(params[:course].permit(:title, :description, :content, :duration, :created_at, :price))

    redirect_to school_path(@school)
  end
end
