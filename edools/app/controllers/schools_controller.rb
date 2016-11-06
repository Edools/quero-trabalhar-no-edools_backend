class SchoolsController < ApplicationController

  def index
    @schools = School.all
  end

  def show
    @school = School.find(params[:id])
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)

    if @school.save
      redirect_to @school
    else
      render :new
    end
  end

  def update

  end

  def destroy
    @school = School.find(params[:id])
    @school.destroy
    redirect_to school_path(@school), :notice => t('flash.notice.school_destroyed')
  end

  private
    def school_params
      params.require(:school).permit(:name, :owner_email, :pitch, :subdomain)
    end
  
end
