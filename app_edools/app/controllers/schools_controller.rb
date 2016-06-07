class SchoolsController < ApplicationController
  def index
    @schools = School.all.order(name: :asc)
  end
end
