class SchoolsController < ApplicationController
  add_breadcrumb 'Escolas', :schools_path

  def index
    @schools = params.has_key?(:q) && !params[:q].blank? ?
               search_by_query(params[:q]) : School.all
    @schools = @schools.order(updated_at: :desc)
  end

  def new
    add_breadcrumb 'Nova'
    @school = School.new
  end

  def edit
    add_breadcrumb 'Editar'
    @school = set_school
  end

  def create
    add_breadcrumb 'Nova'
    @school = School.create(school_params)
    respond_with @school
  end 

  def update
    add_breadcrumb 'Editar'
    @school = set_school
    @school.update(school_params)
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

  def search_by_query(query)
    School.search_name(query)
  end
end
