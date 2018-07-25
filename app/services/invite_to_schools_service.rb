class InviteToSchoolsService
  require 'csv'

  def initialize(school = School.includes(:user_course_registrations))
    @schools = school
  end

  def call
    invites = {}
    @schools.each do |s|
      invites[s.name] = s.user_course_registrations.count
    end
    convert_csv(invites)
  end


  private

  def convert_csv(invites)
    CSV.generate do |csv|
      csv << column_names
      invites.each do |x|
        csv << x
      end
    end  
  end

  def column_names
    ['Escola', 'Alunos']
  end
end