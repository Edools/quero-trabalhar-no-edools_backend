class StudentsController < ApplicationController
  before_action :load_student, except: [:index, :new, :create]

  def index
    @students = Student.page params[:page]
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to student_path(@student)
    else
      flash[:notice] = 'Verifique as informações do formulário.'
      render :new
    end
  end

  def show
    @courses = Course.all
  end

  def edit

  end

  def update
    if @student.update_attributes(student_params)
      redirect_to student_path(@student)
    else
      flash[:notice] = 'Verifique as informações do formulário.'
      render :edit
    end
  end

  def destroy
    @student.destroy
    redirect_to students_path
  end

  def enroll
    redirect_to student_path(@student) unless params[:course_id]
    @course = Course.find(params[:course_id])
    service = EnrollStudentService.new
    service.enroll(@student, @course)

    redirect_to student_path(@student)
  end

  def unenroll
    redirect_to student_path(@student) unless params[:course_id]
    @course = Course.find(params[:course_id])
    service = EnrollStudentService.new
    service.unenroll(@student, @course)

    redirect_to student_path(@student)
  end

  private
  def student_params
    params.require(:student).permit(:name, :email, :birthday)
  end

  def load_student
    @student = Student.find(params[:id])
  end
end
