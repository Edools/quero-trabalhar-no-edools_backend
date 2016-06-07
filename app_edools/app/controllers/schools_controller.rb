class SchoolsController < ApplicationController
  before_action :find_school, only: [:show]

  def index
    @schools = School.all.order(name: :asc)
  end

  def new
    @school = School.new
  end

  def create
    @school = School.create(school_params)
    if @school.save
      redirect_to @school
    else
      render 'new'
    end
  end

  def show
  end

  private
  def school_params
    params.require(:school).permit(:name, :email_responsible, :pitch, :subdomain)
  end

  def find_school
    @school = School.find(params[:id])
  end

end
