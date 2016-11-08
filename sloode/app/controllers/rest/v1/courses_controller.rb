class Rest::V1::CoursesController < Rest::V1::BaseController
  def index
    courses = CourseRepository.get_all_by_school(params[:school_id])
    render json: serialize_models(courses)
  end

  def show
    course = CourseRepository.get_one(params[:id])
    render json: serialize_model(course)
  end
end
