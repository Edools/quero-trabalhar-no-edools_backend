class PagesController < ApplicationController
  def index
  	@schools = School.all

    if current_user.student
      @courses = current_user.courses 
    else
      @courses = current_user.school.courses 
    end
  end

  def discovery
  	if params[:filter_by]
	  	if params[:filter_by] == 'course'
	  		@items = Course.search(params[:search]).paginate(:per_page => 20, :page => params[:page])
	  	elsif params[:filter_by] == 'school'
	  		@items = School.search(params[:search]).paginate(:per_page => 20, :page => params[:page]) 
	  	end
  	else
  		@items = Course.paginate(:per_page => 20, :page => params[:page])
  	end
  end

end
