class SchoolsController < ApplicationController
  before_action :find_school, only: [:show, :edit, :update, :destroy]

  def index
    @schools = School.all.order(name: :asc)
  end

  def new
    @school = School.new
  end

  def create
    @school = School.create(school_params)

    respond_to do |format|
      if @school.save
        format.html { redirect_to @school, notice: t('messages.school_create') }
        format.json { render :show, status: :created, location: @school }
      else
        format.html { render :new }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @school.update(school_params)
        format.html { redirect_to @school, notice: t('messages.school_update') }
        format.json { render :show, status: :ok, location: @school }
      else
        format.html { render :edit }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @school.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: t('messages.school_destroy') }
      format.json { head :no_content }
    end
  end

  private
  def school_params
    params.require(:school).permit(:name, :email_responsible, :pitch, :subdomain)
  end

  def find_school
    @school = School.find(params[:id])
  end

end
