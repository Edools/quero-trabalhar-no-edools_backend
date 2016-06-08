class SchoolsController < ApplicationController

    def index
      @schools = School.all
    end

    def show
      @school = School.find(params[:id])
    end
    
    def new
    end


    def create
      @school = School.new(school_params)
      @school.save
      redirect_to @school
    end

    private
      def school_params
        params.require(:school).permit(:name, :owner_email, :pitch, :subdomain)
      end

end
