class SchoolsController < ApplicationController
  before_action :set_school, except: [:index, :new, :create, :search]

  def index
    @schools = School.all.page(params[:page])
  end

  def show; end

  def search
    @schools = School.by_name(params[:search]).page(params[:page])
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)
    set_schools if @school.save
  end

  def edit; end

  def update
    set_schools if @school.update(school_params)
  end

  def destroy
    set_schools if @school.destroy
  end

  private

  def set_school
    @school = School.includes(:courses).find(params[:id])
  end

  def set_schools
    @schools = School.all.page(params[:page])
  end

  def school_params
    params.require(:school).permit(
      :name, :pitch, :owner_email, :subdomain, :creation_date
    )
  end
end
