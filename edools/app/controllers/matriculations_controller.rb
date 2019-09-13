# frozen_string_literal: true

class MatriculationsController < ApplicationController
  def index
    @matriculations = Matriculation.all

    if params[:filters].present?
      @matriculations = @matriculations.filter_by_title(params[:filters][:title])
      @matriculations = @matriculations.filter_by_school_id(params[:filters][:school_id])
    end

    render json: @matriculations, status: :ok
  end

  def create
    user = User.find(params[:user_id])

    @matriculation = user.matriculations.build(
      params.require(:matriculation).permit(:course_id)
    )

    if @matriculation.save
      render json: @matriculation.id, status: :created
    else
      render json: @matriculation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @matriculation = Matriculation.find(params[:id])

    @matriculation.destroy
    render body: nil
  end
end
