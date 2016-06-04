class ReportController < ApplicationController
  def index
    @schools = School.all.sort_by{|s| s.active_students}
  end
end
