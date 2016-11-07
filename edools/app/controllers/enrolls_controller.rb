class EnrollsController < ApplicationController
  def new
    @student = Student.find(params[:student_id])
    @enroll = @student.enrolls.build
    @schools = School.where(:course.count > 0)
  end

  def create
    @student = Student.find(params[:student_id])
    @enroll = @student.enrolls.create(enroll_params)

    if @enroll.save
      redirect_to @student
    else
      @schools = School.all
      render :new
    end 
  end

  def destroy
    @student = Student.find(params[:student_id])
    @enroll = @student.enrolls.find(params[:id])

    @enroll.destroy
    redirect_to @student
  end

  def show
    @student = Student.find(params[:student_id])
    @enroll = @student.enrolls.find(params[:id])
  end

  private
    def enroll_params
      params.require(:enroll).permit(:student_id, :course_id)
    end
end
