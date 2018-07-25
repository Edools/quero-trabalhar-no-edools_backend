class StudentsController < ApplicationController
  # POST /students
  def create
    @student = Student.create(student_params)
    redirect_to courses_path, notice: I18n.t('defaults.created_with_model', model_name: Student.model_name.human)
  end

  private
    def student_params
      params.require(:student).permit(:course_id, :name)
    end
end
