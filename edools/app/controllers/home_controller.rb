class HomeController < ApplicationController
  def index
    @courses = Course.order(created_at: :desc).all unless params[:courses]
    @schools = School.order(created_at: :desc).all unless params[:schools]
  end
end
