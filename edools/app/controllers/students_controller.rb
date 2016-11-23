class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :status_define

  def index
    @students = Student.all
  end


  def show
  end

  def new
    @student = Student.new
  end

  def edit
  end

  def create
    @student = Student.new(student_params)

      if @student.save
        redirect_to @student, notice: 'Student was successfully created.'
      else
        render :new
      end

  end

  def update
      if @student.update(student_params)
        redirect_to @student, notice: 'Student was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @student.destroy
    redirect_to students_url, notice: 'Student was successfully destroyed.'
  end

  private

    def status_define
      @status = Student.statuses.keys.map{|status| [ status.titleize, status]}
    end

    def set_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:name, :enrollment, :status)
    end
end
