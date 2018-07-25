class SchoolsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource param_method: :school_params
  before_action :set_school, only: [:edit, :show, :update, :destroy]
  
  def index
    @school = SchoolQuery.relation.by_name(params[:search_name])
                                  .page_index(params[:page])
                                  .order_index
  end

  def new
    school = School.new
  end

  def create
    @school = School.new(school_params)
    if @school.save
      redirect_to @school
    else
      render :new, notice: @school.errors 
    end
  end

  def show
  end

  def edit
  end

  def update
    if @school.update(school_params)
      redirect_to @school
    else
      render :edit, notice: @school.errors
    end
  end
  
  def destroy
    if @school.destroy
      redirect_to schools_path
    end
  end

  def csv_schools
    @csv_records = InviteToSchoolsService.new.call
    respond_to do |format|
      format.html
      format.csv { send_data @csv_records, filename: "schools-#{Date.today}.csv"  }
    end
  end

  private

    def set_school
      @school = School.find(params[:id])
    end

    def school_params
      params.require(:school).permit(:name, :owner_email, 
                                    :pitch, :subdomain, 
                                    :date_creation).merge(user: current_user)
    end
end
