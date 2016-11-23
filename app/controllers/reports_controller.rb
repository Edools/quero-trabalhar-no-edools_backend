class ReportsController < ApplicationController

  def index
    @results = Course.joins(:school).group('school_id, name').select('SUM(active_students) AS total, name')
  end
end
