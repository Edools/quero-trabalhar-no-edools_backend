class SchoolPolicy
  attr_reader :admin, :school

  def initialize(user, school)
    @admin = admin
    @school = school
  end

  def destroy?
    @admin && @school.active_students.present?
  end
end