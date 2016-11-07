class StudentsController < ApplicationController
  before_action :find_student, only: [:show, :edit, :update, :destroy]
  before_action :data_student, only: [:index, :new, :create, :edit, :update, :destroy]

  def index
    @students = current_user.students
  end

  def new
    @student = current_user.students.build
  end

  def create
    @course = Course.find(params[:course_id])

    respond_to do |format|
      if @student.save
        format.html { redirect_to user_school_course_path(current_user, @school, @course), notice: "Aluno matriculado com sucesso" }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to  user_school_course_students_path(current_user, @school, @course), notice: "Informações atualizadas com sucesso" }
        format.json { render :show, status: :ok, location: @student.school }
      else
        format.html { render :edit }
        format.json { render json: @student.school.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @student.destroy

    respond_to do |format|
      format.html { redirect_to  user_school_course_students_path(current_user, @school, @course), notice: "Aluno removido do sistema com sucesso" }
      format.json { head :no_content }
    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :address, :document, :phone, :responsible, :registration, :status_student, :course_id, :school_id)
  end

  def find_student
    @student = Student.find(params[:id])
  end

  def data_student
    @school = School.find(params[:school_id])
    @course = Course.find(params[:course_id])
  end
end
