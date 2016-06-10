class StudentsController < ApplicationController

  #index, show, new, edit, create, update, destroy

    def index
      @students = Student.all
    end

    def show
      @student = Student.find(params[:id])
    end

    def new
    end

    def edit
      @student = Student.find(params[:id])
    end

    def create
      @school = School.find(params[:school_id])
      @student = @school.students.create(student_params)

      if @student.invalid?
        redirect_to school_path(@school), status: :bad_request
      else
        redirect_to school_path(@school)
      end
    end

    def update
      @school = School.find(params[:school_id])
      @student = Student.find(params[:id])
      if @student.update(student_params)
        redirect_to school_path(@school)
      else
        render 'edit', status: :bad_request
      end
    end

    def destroy
      @school = School.find(params[:school_id])
      @student = @school.students.find(params[:id])
      @student.destroy
      redirect_to school_path(@school)
    end

    private
      def student_params
        params.require(:student).permit(:name)
      end

end
