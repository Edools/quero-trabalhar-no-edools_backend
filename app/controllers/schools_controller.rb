class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :edit, :update, :destroy]
  before_action :redirect_if_not_owner, only: [:edit, :update, :destroy]

  respond_to :html

  def index
    @schools = School.all
    respond_with(@schools)
  end

  def show
    @courses = @school.courses.all
    respond_with(@school)
  end

  def new
    if !current_user.school
      @school = School.new
    else
      redirect_to edit_school_path(current_user.school.id)
    end

  end

  def edit
  end

  def create
    @school = School.new(school_params)
    @school.user_id = current_user.id
    @school.save
    respond_with(@school)
  end

  def update
    @school.update(school_params)
    respond_with(@school)
  end

  def destroy
    @school.destroy
    respond_with(@school)
  end


  def redirect_if_not_owner
    school = School.find(params[:id])
    owner = school.user
    
    if current_user
      if current_user.school
        if current_user != owner
          redirect_to root_path
        end
      end
    else
      redirect_to root_path
    end
  end


  private
    def set_school
      @school = School.find(params[:id])
    end

    def school_params
      params.require(:school).permit(:name, :contact_email, :subdomain, :foundation, :pitch, :user_id)
    end
end
