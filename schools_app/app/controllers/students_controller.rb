class StudentsController < ApplicationController
  def index
    @students = Student.order(updated_at: :desc).all
  end

  def new
    @student = Student.new
  end

  def edit
    @student = set_student
  end

  def create
    @student = Student.create(student_params)
    respond_with @student
  end

  def update
    @student = set_student
    @student.update(student_params)
    respond_with @student
  end

  def destroy
    @student = set_student
    @student.destroy
    respond_with @student
  end

  private

  def set_student
    Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name, :email)
  end
end
