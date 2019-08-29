module Reports
  class SchoolsController < ApplicationController
    def index
      generate_report if params[:id]

      @reports = SchoolReport.joins(:school).order(created_at: :desc).page(params[:page]).per(10)
    end

    private

    def generate_report
      Reports::School.new(params[:id]).generate

      redirect_to reports_schools_path
    end

    def permited_params
      params.permit(:create_report_school_id)
    end
  end
end
