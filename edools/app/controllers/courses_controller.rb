# frozen_string_literal: true

class CoursesController < ApplicationController
  before_action :set_courses, only: %i[show update destroy]

  def index
    @courses = Course.all

    if params[:filters].present?
      @courses = @courses.filter_by_title(params[:filters][:title])
      @courses = @courses.filter_by_school_id(params[:filters][:school_id])
    end

    render json: @courses, status: :ok
  end

  def show
    render json: @course, status: :ok
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      render json: @course.id, status: :created
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  def update
    if @course.update(course_params)
      render json: @course.id, status: :ok
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @course.destroy
    render body: nil
  end

  private

  def set_courses
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :school_id, :description, :content, :duration, :price)
  end
end
