class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!  
  before_action :configure_permitted_parameters, if: :devise_controller?



	def check_owner_school
		course = Course.find(params[:course_id])
		school = course.school
		owner = school.user
		
	  if current_user
	  	if current_user.school
	  		if current_user == owner
	  			@ownerSchool = true
	  		else
	  			@ownerSchool = false
	  		end
	  	end
	  else
	  	@ownerSchool = false
	  end
	end





  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:type_profile)
    devise_parameter_sanitizer.for(:account_update).push(:type_profile)

  end
end
