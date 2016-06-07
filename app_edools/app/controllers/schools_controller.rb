class SchoolsController < ApplicationController
  def index
    @schools = School.all.order(name: :asc)
  end

  def new
    @school = School.new
  end
end
