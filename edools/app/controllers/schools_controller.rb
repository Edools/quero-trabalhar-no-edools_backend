class SchoolsController < ApplicationController

    #index, show, new, edit, create, update, destroy

    def index
      @schools = School.all
    end

    def show
      @school = School.find(params[:id])
    end

    def new
      @school = School.new
    end

    def edit
      @school = School.find(params[:id])
    end

    def create
      @school = School.new(school_params)
      if @school.invalid?
        render 'new', status: :bad_request
      elsif @school.save
        redirect_to @school
      else
        render 'new', status: :internal_server_error
      end
    end

    def update
      @school = School.find(params[:id])
      if @school.update(school_params)
        redirect_to @school
      else
        render 'edit', status: :bad_request
      end
    end

    def destroy
      @school = School.find(params[:id])
      @school.destroy

      redirect_to schools_path
    end

    def active_students
      @school = School.find(params[:id])
    end

    private
      def school_params
        params.require(:school).permit(:name, :owner_email, :pitch, :subdomain)
      end

end
