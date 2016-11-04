class SchoolsController < ApplicationController
  def new
    @school = School.new
  end
end
