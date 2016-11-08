class Rest::V1::SchoolsController < Rest::V1::BaseController
  def index
    schools = SchoolRepository.get_all
    render json: serialize_models(schools)
  end

  def show
    school = SchoolRepository.get_one(params[:id])
    render json: serialize_model(school)
  end

  def count_active_students
    total = SchoolRepository.get_active_students(params[:id])
    render json: { data:
      { attributes:
        {
          school_id: params[:id],
          active_students: total
        } } }
  end

  def search
    schools = SchoolRepository.search(params[:q])
    render json: serialize_models(schools)
  end
end
