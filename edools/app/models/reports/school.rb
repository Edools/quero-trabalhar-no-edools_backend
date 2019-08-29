module Reports
  class School
    def initialize(school_id, date = Date.current)
      @school_id = school_id
      @date = date
    end

    def generate
      SchoolReport.create(report_params)
    rescue StandardError => e
      e.inspect
    end

    private

    attr_reader :school_id, :date

    def report_params
      {
        school_id: school_id,
        month_active_students: month_students,
        accumulated_active_students: accumulated_students
      }
    end

    def month_students
      base_query.where(created_at: month_range).sum(:active_students)
    end

    def accumulated_students
      base_query.sum(:active_students)
    end

    def month_range
      @month_range ||= date.beginning_of_month..date.end_of_month
    end

    def base_query
      Course.where(school_id: school_id)
    end
  end
end
