class SchoolsController < ApplicationController
  before_action :load_school, except: [:index, :new, :create]

  def index
    @schools = School.all
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)
    if @school.save
      redirect_to school_path(@school)
    else
      flash[:notice] = 'Verifique as informações do formulário.'
      render :new
    end
  end

  def show

  end

  def edit

  end

  def update
    if @school.update_attributes(school_params)
      redirect_to school_path(@school)
    else
      flash[:notice] = 'Verifique as informações do formulário.'
      render :edit
    end
  end

  def destroy
    @school.destroy
    redirect_to schools_path
  end

  def students_report
    @enrollments = @school.enrollments
  end

  private
  def school_params
    params.require(:school).permit(:name, :contact_email, :pitch, :subdomain)
  end

  def load_school
    @school = School.find(params[:id])
  end
end
