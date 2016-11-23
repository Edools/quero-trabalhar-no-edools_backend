class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    students_to_decorate = Student.with_user(current_user)
    @students = StudentDecorator.decorate_collection(students_to_decorate)
    respond_with(@students)
  end

  def show
    respond_with(@student)
  end

  def new
    @student = StudentForm.new
    respond_with(@student)
  end

  def edit
  end

  def create
    @student = StudentForm.new(params[:student_form], current_user)
    @student.save
    respond_with @student, location: -> { students_path }
  end

  def update
    @student_form = StudentForm.new(params, current_user, @student)
    @student_form.update
    respond_with @student, location: -> { students_path }
  end

  def destroy
    @student.destroy
    respond_with(@student)
  end

  private
    def set_student
      @student = Student.find(params[:id])
    end
end
