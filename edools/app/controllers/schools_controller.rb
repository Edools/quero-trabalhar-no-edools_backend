class SchoolsController < ApplicationController
  before_action :set_school, only: %i[show edit update destroy]

  def index
    @schools = School.order(created_at: :desc).all

    @schools = School.search params[:keywords], fields: [:name] if params[:keywords]
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)

    if @school.save
      flash[:success] = 'School created succesfully!'
      redirect_to @school
    else
      flash[:alert] = 'Check if there are any wrong fields'
      render :new
    end
  end

  def show; end

  def edit; end

  def destroy
    @school.destroy
    flash[:success] = 'School deleted succesfully!'

    redirect_to schools_path
  end

  def update
    if @school.update(school_params)
      redirect_to @school
      flash[:success] = 'School updated succesfully!'
    else
      flash[:alert] = 'Check if there are any wrong fields'
      render :edit
    end
  end

  private

  def set_school
    @school = School.find(params[:id])
  end

  def school_params
    params.require(:school).permit(:name, :owner_email, :pitch, :subdomain)
  end
end
