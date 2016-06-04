class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy, :select_course]

  respond_to :html

  def index
    @students = Student.all
    respond_with(@students)
  end

  def show
    respond_with(@student)
  end

  def new
    @student = Student.new
    respond_with(@student)
  end

  def edit
  end

  def create
    @student = Student.new(student_params)
    @student.save
    respond_with(@student)
  end

  def update
    @student.update(student_params)
    respond_with(@student)
  end

  def destroy
    @student.destroy
    respond_with(@student)
  end
  
	def select_course
		@courses = Course.where(status: true)			
	end

	def matriculate
		@classroom = Classroom.new(student_id: params[:student_id],
															 course_id: params[:course_id])
		@classroom.entry_at = DateTime.now
		@classroom.save ? flash[:success] = "sucesso"	: flash[:error] = "Falha"	
		redirect_to @classroom, location: -> { student_path(@classroom.student_id) } 
		
	end


  private
    def set_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:name, :register_number, :status)
    end
    
    def classroom_params
  		params.require(:classroom).permit(:student_id, :course_id)	
  	end
end
