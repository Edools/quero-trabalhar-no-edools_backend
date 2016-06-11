class CoursesController < ApplicationController

    #index, show, new, edit, create, update, destroy

    def index
      @school = School.find(params[:school_id])
      @courses = @school.courses
    end

    def show
      @school = School.find(params[:school_id])
      @course = Course.find(params[:id])
    end

    def new
      @school = School.find(params[:school_id])
    end

    def edit
      @school = School.find(params[:school_id])
      @course = Course.find(params[:id])
    end

    def create
      @school = School.find(params[:school_id])
      @course = @school.courses.create(course_params)
      if @course.invalid?
        render 'new', status: :bad_request
      else
        redirect_to action: "show", school_id: @school.id, id: @course.id
      end
    end

    def update
      @school = School.find(params[:school_id])
      @course = Course.find(params[:id])
      if @course.update(course_params)
        redirect_to action: "show", school_id: @school.id, id: @course.id
      else
        render 'edit', status: :bad_request
      end
    end

    def destroy
      @school = School.find(params[:school_id])
      @course = @school.courses.find(params[:id])
      @course.destroy
      #redirect_to school_path(@school)
      redirect_to action: "index", school_id: @school.id      
    end

    def management
      @school = School.find(params[:school_id])
      @course = @school.courses.find(params[:id])
      @students = Student.all
    end

    def enroll
      @school = School.find(params[:school_id])
      @course = @school.courses.find(params[:id])
      @course.students.clear

      students_ids = params[:students_ids].split(",")

      if students_ids != nil
        students_ids.each do |id|
          student = Student.find(id)
          @course.students << student
        end
        redirect_to school_path(@school)
      end
    end

    private
      def course_params
        params.require(:course).permit(:title, :description, :content, :duration, :price, :school_id)
      end

end
