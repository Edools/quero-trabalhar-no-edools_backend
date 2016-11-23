class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    if params[:school_name].present?
      schools_to_decorate = School
                              .search_by_name(params[:school_name])
                              .with_user(current_user)
    else
      schools_to_decorate = School.with_user(current_user)
    end
    @schools = SchoolDecorator.decorate_collection(schools_to_decorate)
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
    @school.save_with_user(current_user)
    respond_with @school, location: -> { schools_path }
  end

  def update
    @school_form = SchoolForm.new(params)
    @school_form.update
    respond_with @school, location: -> { schools_path  }
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
      params.require(:school_form).permit(:name, :pitch, :subdomain, :user_id)
    end
end
