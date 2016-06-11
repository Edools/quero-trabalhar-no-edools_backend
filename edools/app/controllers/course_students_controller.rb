class CourseStudentsController < ApplicationController
  before_action :set_course_student, only: [:show, :edit, :update, :destroy]

  def index
    @course_students = CourseStudent.all
  end

  def show
  end

  def new
    @course_student = CourseStudent.new
  end


  def edit
  end

  def create
    @course_student = CourseStudent.new(course_student_params)

      if @course_student.save
        redirect_to @course_student, notice: 'Course student was successfully created.'
      else
        render :new
      end
  end

  def update

      if @course_student.update(course_student_params)
        redirect_to @course_student, notice: 'Course student was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @course_student.destroy
      redirect_to course_students_url, notice: 'Course student was successfully destroyed.'
  end

  private

    def set_course_student
      @course_student = CourseStudent.find(params[:id])
    end

    def course_student_params
      params.require(:course_student).permit(:course_id, :student_id, :name)
    end
end
