class CoursesController < ApplicationController
  before_action :set_school
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
    # Providing simple search
    if params[:title]
      @courses = @school.courses.where(title: params[:title])
    else
      @courses = @school.courses.all
    end
  end

  def new
    @course = @school.courses.new
  end

  def create
    @course = @school.courses.new(course_params)
    if @course.save
      redirect_to school_courses_url, notice: 'Curso salva com sucesso'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @course.update_attributes(course_params)
      redirect_to school_courses_url, notice: 'Curso salva com sucesso'
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    if @course.destroy
      redirect_to school_courses_url, notice: "#{@course.title} foi apagada com sucesso."
    else
      redirect_to :back, alert: 'O curso não pôde ser apagada'
    end
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def set_school
    @school = School.find(params[:school_id])
  end

  def course_params
    params.require(:course).permit(:title, :description, :content, :duration,
                                    :active_students, :price, :school_id)
  end
end
