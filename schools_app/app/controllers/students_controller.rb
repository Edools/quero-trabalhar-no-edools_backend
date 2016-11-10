class StudentsController < ApplicationController
  add_breadcrumb 'Alunos', :students_path

  def index
    @students = Student.order(updated_at: :desc).all
  end

  def new
    add_breadcrumb 'Novo'
    @student = Student.new
  end

  def edit
    add_breadcrumb 'Editar'
    @student = set_student
  end

  def create
    add_breadcrumb 'Novo'
    @student = Student.create(student_params)
    respond_with @student
  end

  def update
    add_breadcrumb 'Editar'
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
