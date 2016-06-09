class CoursesController < ApplicationController

    #index, show, new, edit, create, update, destroy

    def index
      @school = School.find(params[:school_id])
      @courses = @school.courses
    end

    def show
      @course = Course.find(params[:id])
    end

    def new
    end

    def edit
      @course = Course.find(params[:id])
    end

    def create
      @school = School.find(params[:school_id])
      @course = @school.courses.create(course_params)
      redirect_to school_path(@school)
    end

    def update
      @school = School.find(params[:school_id])
      @course = Course.find(params[:id])
      if @course.update(course_params)
        redirect_to school_path(@school)
      else
        render 'edit'
      end
    end

    def destroy
      @school = School.find(params[:school_id])
      @course = @school.courses.find(params[:id])
      @course.destroy
      redirect_to school_path(@school)
    end

    private
      def course_params
        params.require(:course).permit(:title, :description, :content, :duration, :price, :school_id)
      end

end
