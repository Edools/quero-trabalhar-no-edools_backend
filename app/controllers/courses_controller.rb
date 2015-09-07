class CoursesController < ApplicationController
  before_action :set_course, only: [:destroy]
  def index
    @courses = Course.all
  end

  def destroy
    @course.destroy

    redirect_to courses_path, notice: 'Excluído com sucesso.'
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end
end
