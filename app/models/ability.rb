class Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role? :admin
      can :manage, :all
    else
      can :read, Course
      can :read, School
      can :read, UserCourseRegistration, user_id: user.id
      can :manage, UserCourseRegistration, user_id: user.id
    end

  end
end
