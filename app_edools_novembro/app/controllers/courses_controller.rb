class CoursesController < ApplicationController
  before_action :find_course, only: [:show, :edit, :update, :destroy]

  def new
    @school = School.find(params[:school_id])
    @course = current_user.courses.build
  end

  def create
    @course = current_user.courses.build(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to user_school_path(current_user, @course.school), notice: "Curso criada com sucesso" }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to user_school_path(current_user, @course.school), notice: "Curso atualizado com sucesso" }
        format.json { render :show, status: :ok, location: @course.school }
      else
        format.html { render :edit }
        format.json { render json: @course.school.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @course.destroy

    respond_to do |format|
      format.html { redirect_to user_school_path(current_user, @course.school), notice: "Curso apagado com sucesso" }
      format.json { head :no_content }
    end
  end

  private

  def course_params
    params.require(:course).permit(:title, :description, :content, :duration, :price, :school_id)
  end

  def find_course
    @course = Course.find(params[:id])
  end
end
