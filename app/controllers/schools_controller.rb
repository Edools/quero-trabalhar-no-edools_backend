class SchoolsController < ApplicationController
  before_filter :load_school, only: [:show, :destroy]

  def index
    @schools = School.by_name(params[:search])
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)

    if @school.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def show
  end

  def destroy
    redirect_to action: :index if @school.destroy
  end

  private

  def school_params
    params.require(:school).permit(:id, :name, :owner_email, :pitch, :subdomain)
  end

  def load_school
    @school = School.find_by(id: params[:id])
  end
end
