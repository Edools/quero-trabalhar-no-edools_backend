class SchoolsController < ApplicationController
  def index
    @schools = School.all
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)

    if @school.save
      redirect_to schools_path, notice: 'Salvo com sucesso'
    else
      render :new
    end
  end

  private

  def school_params
    params.require(:school).permit(:name, :owner_email, :pitch, :subdomain)
  end
end
