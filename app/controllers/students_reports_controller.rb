class StudentsReportsController < ApplicationController
  def active_by_school
    if params[:school] and not params[:school].empty?
      @enrollments = Enrollment.includes(:course, :student).references(:courses, :students).where(courses: {school_id: params[:school]}).where(status: :active)
    else
      @enrollments = Enrollment.where(status: :active)
    end
  end

  def active_by_school_pdf

    respond_to do |format|
      format.pdf do
		if params[:school] and not params[:school].empty?
		  @enrollments = Enrollment.includes(:course, :student).references(:courses, :students).where(courses: {school_id: params[:school]}).where(status: :active)
		else
		  @enrollments = Enrollment.where(status: :active)
		end

		pdf = ActiveStudentsPDF.new(@enrollments, current_user)

        send_data pdf.render
      end
    end
  end
end
