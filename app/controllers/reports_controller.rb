class ReportsController < ApplicationController
  def schools_active_students
    @schools = School.all
  end
end
