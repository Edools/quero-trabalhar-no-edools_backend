class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @schools = School.all
    respond_with(@schools)
  end

  def show
    respond_with(@school)
  end

  def new
    @school = SchoolForm.new
    respond_with(@school)
  end

  def edit
  end

  def create
    @school = SchoolForm.new(school_params)
    @school.save
    respond_with @school, location: -> { schools_path }
  end

  def update
    @school.update(school_params)
    respond_with(@school)
  end

  def destroy
    @school.destroy
    respond_with(@school)
  end

  private
    def set_school
      @school = School.find(params[:id])
    end

    def school_params
      params.require(:school_form).permit(:name, :pitch, :subdomain)
    end
end
