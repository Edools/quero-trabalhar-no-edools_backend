class CoursesController < ApplicationController
  before_action :find_school_course, only: [:show, :edit, :update, :destroy]

  def new
    @course = Course.new
  end

  def create
    @school = School.find(params[:id])
    @course = @school.courses.create!(params[:course].permit(:title, :description, :content, :duration, :created_at, :price))

    respond_to do |format|
      if @course.save
        format.html { redirect_to school_path(@school), notice: t('messages.course_create') }
        format.json { render :show, status: :created, location: @school }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to school_path(@school), notice: t('messages.course_update') }
        format.json { render :show, status: :ok, location: @school }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @course.destroy

    respond_to do |format|
      format.html { redirect_to school_path(@school), notice: t('messages.course_destroy') }
      format.json { head :no_content }
    end
  end

  private
  def course_params
    @course = params.require(:course).permit(:title, :description, :content, :duration, :created_at, :price)
  end

  def find_school_course
    @course = Course.find(params[:id])
    @school = @course.school_id
  end
end
