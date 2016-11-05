class CoursesController < ApplicationController
    def new
        @course = @School.find(params[:school_id]).courses.build 
    end

    def create

    end

    private
        def course_params
        end
end
