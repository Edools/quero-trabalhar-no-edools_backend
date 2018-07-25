class UserCourseRegistrationsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource param_method: :invite_params
  before_action :set_invite, only: [:show, :destroy]
  before_action :call_check_invite, only: [:create]

  def index
    @invite = UserCourseRegistration.includes(:course, :school, :user).
                                      paginate(:page => params[:page])
  end

  def create
    if @check_invite
      render json: @check_invite
    else
      render json: false
    end
  end

  def show
  end
  
  def destroy
    if @invite.destroy
      redirect_to user_course_registrations_path
    end
  end

  private

    def call_check_invite
      @check_invite = CheckInvitesService.new(invite_params[:user][:id], 
                                              invite_params[:course_id]).
                                              call
    end

    def set_invite
      @invite = UserCourseRegistration.find(params[:id])
    end

    def invite_params
      params.require(:user_course_registration).permit(:course_id).
                                                merge(user: current_user)
    end
end
