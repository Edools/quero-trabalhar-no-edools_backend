class StudentsController < ApplicationController

  def index
    @school = School.find(params[:school_id])
    @students = @school.students.all.order(name: :asc)
  end

  def new
    @student = Student.new
  end

  def create
    @school = School.find(params[:id])
    @student = @school.students.create(params[:student].permit(:name, :address, :phone, :document, :status))

    respond_to do |format|
      if @student.save
        format.html { redirect_to school_path(@school), notice: t('messages.student_create') }
        format.json { render :show, status: :created, location: @school }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @school = School.find(params[:school_id])
    @student = Student.find(params[:id])
  end

  def update
    @school = School.find(params[:id])
    @student = Student.find(params[:school_id])

    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to school_students_path(@school), notice: t('messages.student_update') }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @student = Student.find(params[:school_id])
    @school = @student.school
    @student.destroy

    respond_to do |format|
      format.html { redirect_to school_students_path(@school), notice: t('messages.student_destroy') }
      format.json { head :no_content }
    end
  end

  private
  def student_params
    params.require(:student).permit(:name, :address, :phone, :document, :status)
  end

  def find_school_student
    @student = Student.find(params[:id])
    @school = @student.school_id
  end
end
