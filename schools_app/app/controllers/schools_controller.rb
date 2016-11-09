class SchoolsController < ApplicationController
  def index
    @schools = School.order(updated_at: :desc).all
  end

  def show
    @school = set_school
  end

  def new
    @school = School.new
  end

  def edit
    @school = set_school
  end

  def create
    @school = School.create(school_params)
    respond_with @school
  end 

  def update
    @school = set_school
    respond_with @school
  end

  def destroy
    @school = set_school
    @school.destroy
    respond_with @school
  end

  private

  def set_school
    School.find(params[:id])
  end

  def school_params
    params.require(:school).permit(:name, :owner_email, :pitch, :subdomain)
  end
end
