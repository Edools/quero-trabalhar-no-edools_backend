# frozen_string_literal: true

class SchoolsController < ApplicationController
  before_action :set_schools, only: %i[show update destroy]

  def index
    @schools = School.all

    if params[:filters].present?
      @schools = @schools.filter_by_name(params[:filters][:name])
    end

    render json: @schools, status: :ok
  end

  def show
    render json: @school, status: :ok
  end

  def create
    @school = School.new(school_params)

    if @school.save
      render json: @school.id, status: :created
    else
      render json: @school.errors, status: :unprocessable_entity
    end
  end

  def update
    if @school.update(school_params)
      render json: @school.id, status: :ok
    else
      render json: @school.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @school.destroy
    render body: nil
  end

  def active_users
    authorize School

    @school = School.find(params[:user_id])

    render json: @school.users, status: :ok
  end

  private

  def set_schools
    @school = School.find(params[:id])
  end

  def school_params
    params.require(:school).permit(:name, :owner_id, :pitch)
  end
end
