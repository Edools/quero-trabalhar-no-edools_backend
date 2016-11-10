class EnrollmentsController < ApplicationController
  def index
    @enrollments = Enrollment.order(updated_at: :desc).all
  end

  def new
    @enrollment = Enrollment.new
  end

  def create
    @enrollment = Enrollment.create(enrollment_params)
    respond_with @enrollment
  end

  def destroy
    @enrollment = set_enrollment
    @enrollment.destroy
    respond_with @enrollment
  end

  private

  def set_enrollment
    Enrollment.find(params[:id])
  end

  def enrollment_params
    params.require(:enrollment).permit(:course_id, :student_id)
  end
end
