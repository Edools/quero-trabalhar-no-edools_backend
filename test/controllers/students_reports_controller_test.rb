require 'test_helper'

class StudentsReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get active_by_school" do
    get students_reports_active_by_school_url
    assert_response :success
  end

end
