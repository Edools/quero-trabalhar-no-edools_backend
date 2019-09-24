class SchoolsController < ApplicationController
  before_action :set_school, except: [:index, :new, :create]

  def index; end

  def show; end

  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)
    @school.save
  end

  def edit; end

  def update
    @params.update(school_params)
  end

  def destroy
    @school.destroy
  end

  private

  def set_school
    @school = School.find(params[:id])
  end

  def school_params
    params.require(:school).permit(
      :name, :pitch, :owner_email, :subdomain, :creation_date
    )
  end
end
