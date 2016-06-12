class CoursesStudentsController < ApplicationController
  before_action :set_courses_student, only: [:show, :edit, :update, :destroy]
  before_action :set_course
  before_action :set_school

  respond_to :html

  def index
    @course_with_students = Course.with_students
    respond_with(@course_with_students)
  end

  def show
  end

  def new
    @courses_student = CourseStudentForm.new
    @students = Student.with_user(current_user)
    respond_with(@courses_student)
  end

  def edit
  end

  def create
    @course_student = CourseStudentForm.new(params[:course_student_form], @course)
    @course_student.save
    respond_with @course_student, location: -> { school_course_courses_students_path  }
  end

  def destroy
    @courses_student.destroy
    respond_with @courses_student, location: -> { school_course_courses_students_path  }
  end

  private
    def set_courses_student
      @courses_student = Student.find(params[:id])
    end

    def set_course
      @course = Course.find(params[:course_id])
    end

    def set_school
      @school = School.find(params[:school_id])
    end
end
